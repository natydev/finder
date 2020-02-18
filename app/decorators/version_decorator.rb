# frozen_string_literal: true

class VersionDecorator < Draper::Decorator
  include TimestampsDeco

  delegate_all

  def preview
    h.truncate(object.item.summary, length: 35)
  end

  def path
    if object.item_type == 'Item'
      h.box_item_path(box_id: object.item.box_id, id: object.item.id)
    else
      h.box_path(id: object.item.id)
    end
  end

  def typology_icon
    if object.item_type == 'Item'
      h.raw h.content_tag(:i, '', class: Icon.css_for(:item))
    else
      h.raw h.content_tag(:i, '', class: object.item.typology_object.icon)
    end
  end
end
