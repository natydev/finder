# frozen_string_literal: true

class BoxDecorator < Draper::Decorator
  include TimestampsDeco
  include PictureDeco
  include UsingDeco
  include BadgeTagsDeco
  include ParentIconDeco
  include BaseErrorDeco
  include IconDeco
  include BadgePlaceCodeDeco
  include PrimaryBadgeCodeDeco

  def self.collection_decorator_class
    PaginatingDecorator
  end

  delegate_all
  decorates_association :spot

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

  def badge_code
    value_icon(object.code, :code)
  end

  def badge_spot_name
    parent_icon(:spot_name, Icon::SPOT)
  end

  def badge_place_name
    parent_icon(:place_name, Icon::PLACE)
  end

  def badge_place_and_spot
    badge_place_name + value_icon('', :arrow_right, style: 'fas mr-3 ml-3') + badge_spot_name
  end

  def badge_typology
    parent_icon(:typology_humanize, object.typology_object.icon)
  end

  def badge_issued_on
    parent_icon(:issued_on_human, Icon::ISSUED_ON)
  end

  def badge_volume
    value_icon(h.number_to_human(object.volume, units: :volume), :volume)
  end

  def free_ratio_icon
    value_icon(free_ratio_human, "free_ratio_#{object.free_ratio}")
  end

  def free_ratio_human
    h.number_to_percentage(object.free_ratio, strip_insignificant_zeros: true)
  end

  def badge_quantity
    value_icon(object.quantity, :quantity)
  end

  def badge_items_quantity
    value_icon('', :item) + value_icon(object.items_quantity, :quantity)
  end
end
