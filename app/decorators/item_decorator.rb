# frozen_string_literal: true

class ItemDecorator < Draper::Decorator
  include TimestampsDeco
  include PictureDeco
  include UsingDeco
  include BadgeTagsDeco
  include ParentIconDeco
  include IconDeco
  include BadgePlaceCodeDeco
  include PrimaryBadgeCodeDeco
  include BadgeFullcodeDeco

  delegate_all
end
