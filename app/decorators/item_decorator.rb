class ItemDecorator < Draper::Decorator
  include TimestampsDeco
  include PictureDeco
  include UsingDeco
  include BadgeTagDeco
  include ParentIconDeco

  delegate_all

  def badge_box_code
    parent_icon(:box_code, 'box')
  end

end
