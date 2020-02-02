# frozen_string_literal: true

# Shared badge of fullcode (place_code + spot_code + code) for Box and Item records
module BadgeFullcodeDeco
  extend ActiveSupport::Concern

  def badge_fullcode
    value_icon(
      badge_place_code.to_s +
      h.content_tag(
        :small, "#{object.spot_code}-",
        class: 'code-secondary'
      ).to_s +
      primary_badge_code,
      :code
    )
  end
end
