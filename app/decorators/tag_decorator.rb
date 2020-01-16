class TagDecorator < Draper::Decorator
  include TimestampsDeco
  include BadgeTagDeco

  def self.collection_decorator_class
    PaginatingDecorator
  end

  delegate_all

  def badge
    badge_tag(object)
  end

end
