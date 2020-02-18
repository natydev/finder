# frozen_string_literal: true

class VersionDecorator < Draper::Decorator
  include TimestampsDeco

  delegate_all

  def path
    if object.item_type == 'Item'
      Rails.application.routes.url_helpers
           .box_item_path(box_id: object.item.box_id, id: object.item.id)
    else
      Rails.application.routes.url_helpers
           .box_path(id: object.item.id)
    end
  end
end
