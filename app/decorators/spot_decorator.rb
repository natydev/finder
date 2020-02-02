# frozen_string_literal: true

class SpotDecorator < Draper::Decorator
  include TimestampsDeco
  include ParentIconDeco
  include IconDeco
  include BadgePlaceCodeDeco
  include PrimaryBadgeCodeDeco

  def self.collection_decorator_class
    PaginatingDecorator
  end

  delegate_all

  def badge_fullcode
    value_icon(
      badge_place_code.to_s +
      primary_badge_code,
      :code
    )
  end

  def badge_place_name
    parent_icon(:place_name, 'building')
  end
end
