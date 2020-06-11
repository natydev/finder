# frozen_string_literal: true

class SearchDecorator < Draper::Decorator
  include FreeRatioDeco

  def self.collection_decorator_class
    PaginatingDecorator
  end

  def item?
    object['box_id'].present?
  end

  def item_id
    object['item_id']
  end

  def picture_icon
    h.raw h.content_tag(:i, '', class: 'far fa-image ml-1') if picture?
  end

  def picture?
    picture_data.present?
  end

  def picture_data
    item? ? object['item_picture_data'] : object.picture_data
  end

  def typology_icon
    h.raw h.content_tag(:i, '', class: object.typology_object.icon)
  end

  def summary
    item? ? object['item_summary'] : object.summary
  end

  def code
    object.code
  end

  def spot
    object.spot
  end

  def updated_at
    object.updated_at
  end

  def using_strike
    'using' if using.present?
  end

private

  def using
    item? ? object['item_using'] : object.using
  end
end
