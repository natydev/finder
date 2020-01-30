# frozen_string_literal: true

module ItemOp
  # Update #items_quantity attribute in parent Box
  class SetBoxItemsQuantity
    extend Dry::Initializer

    option :model_object

    def self.call(**args)
      new(**args).call
    end

    def call
      if model_object.destroyed?
        model_object.box.update(items_quantity: count_items_quantity)
      elsif model_object.quantity_before_last_save != model_object.quantity
        model_object.box.update(items_quantity: count_items_quantity)
      elsif model_object.versions.count.zero?
        model_object.box.update(items_quantity: count_items_quantity)
      else
        true
      end
    end

  private

    def count_items_quantity
      Item.where(box_id: model_object.box_id, owner_id: model_object.owner_id).sum(:quantity)
    end
  end
end
