# frozen_string_literal: true

# Shared badge of #place_code for Box and Spot records
module BadgePlaceCodeDeco
  extend ActiveSupport::Concern

  def badge_place_code
    h.content_tag(
      :small, "#{object.place_code}-",
      class: 'code-secondary'
    )
  end
end
