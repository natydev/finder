class BoxDecorator < Draper::Decorator
  include TimestampsDeco
  include PictureDeco

  def self.collection_decorator_class
    PaginatingDecorator
  end

  delegate_all

  def badge_spot_name
    h.raw h.content_tag(:i, '', class: 'fa fa-door-open mr-1') + object.spot_name
  end

  def free_ratio_human
    h.number_to_percentage(object.free_ratio, strip_insignificant_zeros: true)
  end

end
