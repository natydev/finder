class PlaceDecorator < Draper::Decorator
  include TimestampsDeco
  include BaseErrorDeco

  def self.collection_decorator_class
    PaginatingDecorator
  end

  delegate_all

end
