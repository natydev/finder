module ItemOp
  class Destroy < BaseDestroyer
    include ItemOp::BoxItemsQuantity

    option :model_klass, default: proc { Item }

    def call
      check_ownership
      .bind{ destroy_record }
      .bind(method(:box_items_quantity))
    end
  end
end