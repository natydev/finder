class SearchDecorator < Draper::Decorator

  def self.collection_decorator_class
    PaginatingDecorator
  end

  def is_item?
    object['box_id'].present?
  end

  def item_id
    object['item_id']
  end

  def picture_icon
    if picture?
      h.raw h.content_tag(:i, '', class: 'far fa-image ml-1')
    end
  end

  def picture?
    picture_data.present?
  end

  def picture_data
    is_item? ? object['item_picture_data'] : object.picture_data
  end

  def typology_icon
    h.raw h.content_tag(:i, '', class: object.typology_object.icon)
  end

  def summary
    is_item? ? object['item_summary'] : object.summary
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

end
