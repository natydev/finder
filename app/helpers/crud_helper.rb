# frozen_string_literal: true

# provide common helper methods for CRUD interface
module CRUDHelper
  def link_to_list(path, entities:)
    link_to path, class: 'btn btn-light float-right',
                  title: t('common.actions.index', entity: entities) do
      content_tag(:i, '', class: 'fas fa-arrow-up')
    end
  end

  # usage examples:
  # for a canonical 1st level resource:
  #  link_to_item(@object_to_link)
  # for a 2nd level resource:
  #  link_to_item(@parent_object, @object_to_link)
  def link_to_item(*entities)
    link_to polymorphic_path([entities].flatten), class: 'btn btn-light float-right',
                                                  title: t('common.actions.show', entity: entities.last) do
      content_tag(:i, '', class: 'fas fa-arrow-up')
    end
  end

  # usage examples:
  # for a canonical 1st level resource:
  #  link_to_new(Customer)
  # for a 2nd level resource:
  #  link_to_new(@parent_object, Doorkeeper::Application)
  def link_to_new(*entities)
    link_to new_polymorphic_path([entities].flatten), class: 'btn btn-outline-success float-right',
                                                      title: t('common.actions.new', entity: entities.last.model_name.human(count: 1)) do
      content_tag(:i, '', class: 'fas fa-plus')
    end
  end

  # usage examples:
  # for a canonical 1st level resource:
  #  link_to_edit(@object_to_edit)
  # for a 2nd level resource:
  #  link_to_edit(@parent_object, @object_to_edit)
  def link_to_edit(*entities)
    link_to edit_polymorphic_path([entities].flatten), class: 'btn btn-outline-warning float-right',
                                                       title: t('common.actions.edit', entity: entities.last) do
      content_tag(:i, '', class: 'fas fa-edit')
    end
  end

  # usage examples:
  # for a canonical 1st level resource:
  #  link_to_show(@object_to_show)
  # for a 2nd level resource:
  #  link_to_show(@parent_object, @object_to_show)
  def link_to_show(*entities)
    link_to polymorphic_path([entities].flatten), class: 'btn btn-outline-primary float-right',
                                                  title: t('common.actions.show', entity: entities.last) do
      content_tag(:i, '', class: 'fas fa-eye')
    end
  end

  # usage examples:
  # for a canonical 1st level resource:
  #  link_to_destroy(@object_to_destroy)
  # for a 2nd level resource:
  #  link_to_destroy(@parent_object, @object_to_destroy)
  def link_to_destroy(*entities)
    link_to polymorphic_path([entities].flatten), class: 'btn btn-outline-danger float-right',
                                                  data: { confirm: t('common.actions.confirm_destroy') }, method: :delete,
                                                  title: t('common.actions.delete', entity: entities.last) do
      content_tag(:i, '', class: 'fas fa-trash')
    end
  end

  def intro_actions(summary:, style: nil)
    content_tag(:div, class: ['row intro-actions p-1 mb-lg-3 no-gutters', style]) do
      content_tag(:div, class: 'col-md-9 summary') do
        content_tag(:h2) do
          concat content_tag(:i, '', class: [@context_icon, 'mr-2']) if @context_icon.present?
          concat summary
        end
      end +
        content_tag(:div, class: 'col-md-3 context-actions pb-2') do
          yield
        end
    end
  end

  def search_area(url:)
    # ActionView::OutputBuffer.new(self)
    search_form_for @q, url: url, wrapper: :search_horizontal_form, class: 'search' do |f|
      content_tag(:div, class: 'row') do
        yield.map do |inp|
          content_tag(:div, class: 'col-md') do
            f.input(inp[:input_name], inp[:options])
          end
        end.join("\n")
        content_tag(:div, class: 'col-md text-right') do
          link_to(t('common.reset'), url, class: 'btn btn-secondary btn-sm mr-2') if params[:q].present?
          f.button(:submit, class: 'btn btn-primary btn-sm')
        end
      end
    end
  end

  def tabular_list(collection = nil)
    content_tag(:div, class: 'row no-gutters') do
      content_tag(:div, class: 'col-12 table-responsive') do
        if collection.any?
          content_tag(:table, class: 'table table-hover table-sm') do
            yield collection
          end
        else
          content_tag(:p, t('common.no_item_present'))
        end
      end
    end
  end

  def tabular_head(model, tag:, labels:)
    content_tag(tag, class: 'thead-light') do
      content_tag(:tr) do
        labels.map do |label|
          concat content_tag(:th, model.human_attribute_name(label))
        end
        concat content_tag(:th, t('common.actions.title'), class: 'text-center', colspan: 3)
      end
    end
  end

  def tabular_icon_head(model, tag:, labels:)
    content_tag(tag, class: 'thead-light') do
      content_tag(:tr) do
        labels.map do |label|
          concat content_tag(:th, icon_or_text(label, model))
        end
        concat content_tag(:th, t('common.actions.title'), class: 'text-center', colspan: 3)
      end
    end
  end

  def icon_or_text(label, model)
    content_tag(:i, '',
                class: Icon.css_for(label), title: model.human_attribute_name(label),
                data: { toggle: 'tooltip' })
  rescue StandardError
    model.human_attribute_name(label)
  end

  def paginator(items)
    content_tag(:div, class: 'row') do
      content_tag(:div, class: 'col-12') do
        paginate items, theme: 'twitter-bootstrap-4'
      end
    end
  end

  # canonical usage:
  #   detail_row(@record, :attr_name)
  # with block given:
  #   detail_row(@record, :attr_name) do
  #     = l(@record.attr_name, format: :long)
  # custom label:
  #   detail_row(@record, :attr_name, custom_label: 'Foo label')
  # custom label and block given:
  #   detail_row(@record, :attr_name, custom_label: 'Foo label') do
  #     = l(@record.attr_name, format: :long)
  def detail_row(record = nil, label = nil, custom_label: nil)
    value = record.public_send(label)
    return unless value.present?

    content_tag(:div, class: 'row detail-row mx-2 pt-3 pb-2') do
      content_tag(:div, class: 'col-sm-3') do
        if custom_label.blank?
          content_tag(:b, record.class.human_attribute_name(label))
        else
          content_tag(:b, custom_label)
        end
      end +
        content_tag(:div, class: 'col-sm-9') do
          if block_given?
            yield
          else
            value.to_s
          end
        end
    end
  end

  def flash_level_to_alert_class(level)
    {
      'notice' => 'alert-info',
      'success' => 'alert-success',
      'error' => 'alert-error',
      'alert' => 'alert-warning'
    }[level]
  end

  def bool_to_icon(val, icon: 'fa fa-check')
    content_tag(:i, '', class: icon) if val.present?
  end
end
