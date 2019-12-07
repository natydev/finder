class BoxDecorator < Draper::Decorator
  include TimestampsDeco

  delegate_all

  def badge_spot_name
    h.raw h.content_tag(:i, '', class: 'fa fa-door-open mr-1') + object.spot_name
  end

  def image_tag_medium
    h.image_tag(object.picture(:medium).url) if object.picture.present?
  end

end
