class BoxDecorator < Draper::Decorator
  include TimestampsDeco
  include PictureDeco
  include UsingDeco
  include BadgeTagDeco
  include ParentIconDeco

  def self.collection_decorator_class
    PaginatingDecorator
  end

  delegate_all
  decorates_association :spot

  def badge_spot_name
    parent_icon(:spot_name, 'door-open')
  end

  def badge_place_name
    parent_icon(:place_name, 'building')
  end

  def badge_issued_on
    parent_icon(:issued_on, 'calendar-check')
  end

  def free_ratio_human
    h.number_to_percentage(object.free_ratio, strip_insignificant_zeros: true)
  end

end
