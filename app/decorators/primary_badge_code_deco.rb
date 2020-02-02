# frozen_string_literal: true

# Shared badge of #place_code for Box and Spot records
module PrimaryBadgeCodeDeco
  extend ActiveSupport::Concern

  def primary_badge_code
    h.content_tag(
      :big, object.code,
      class: 'code-master ml-1'
    )
  end
end
