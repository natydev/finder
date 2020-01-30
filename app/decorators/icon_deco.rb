# frozen_string_literal: true

module IconDeco
  extend ActiveSupport::Concern

  def label_icon(l, i, style: 'fas')
    "<i class=\"#{Icon.css_for(i, style: style)}\"></i> #{object.class.human_attribute_name(l)}".html_safe
  end

  def value_icon(v, i, style: 'fas')
    "<i class=\"#{Icon.css_for(i, style: style)}\"></i> #{v}".html_safe
  end
end
