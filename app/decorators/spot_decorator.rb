# frozen_string_literal: true

class SpotDecorator < Draper::Decorator
  include TimestampsDeco
  include ParentIconDeco

  def self.collection_decorator_class
    PaginatingDecorator
  end

  delegate_all

  def badge_place_name
    parent_icon(:place_name, 'building')
  end
end
