# frozen_string_literal: true

module IconDeco
  extend ActiveSupport::Concern

  def label_icon(label, icon, style: 'fas')
    "<i class=\"#{Icon.css_for(icon, style: style)}\"></i> #{object.class.human_attribute_name(label)}".html_safe
  end

  def value_icon(value, icon, style: 'fas')
    "<i class=\"#{Icon.css_for(icon, style: style)}\"></i> #{value}".html_safe
  end
end
