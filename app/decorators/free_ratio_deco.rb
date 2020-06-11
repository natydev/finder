# frozen_string_literal: true

# Shared badge of #place_code for Box and Spot records
module FreeRatioDeco
  extend ActiveSupport::Concern

  def free_ratio_human
    h.number_to_percentage(object.free_ratio, strip_insignificant_zeros: true)
  end

  def free_ratio_color
    h.raw h.content_tag(:span, free_ratio_human, class: ['search-item', 'free-ratio', "color-#{object.free_ratio}"])
  end
end
