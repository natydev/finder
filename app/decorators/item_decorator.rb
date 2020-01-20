class ItemDecorator < Draper::Decorator
  include TimestampsDeco
  include PictureDeco
  include UsingDeco
  include BadgeTagsDeco
  include ParentIconDeco
  include IconDeco

  delegate_all

  def badge_box_code
    parent_icon(:box_code, 'box')
  end

end
