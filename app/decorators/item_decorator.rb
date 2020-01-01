class ItemDecorator < Draper::Decorator
  include TimestampsDeco
  include PictureDeco
  include UsingDeco
  include BadgeTagDeco

  delegate_all

  def badge_box_code
    h.raw h.content_tag(:i, '', class: 'fa fa-box mr-1') + object.box_code
  end

end
