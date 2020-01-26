module ItemOp
  class Destroy < BaseDestroyer
    include ItemOp::BoxItemsQuantity
    include ItemOp::IndexKlass
    include SyncIndex

    option :model_klass, default: proc { Item }

    def call
      check_ownership
      .bind{ destroy_record }
      .bind(method(:box_items_quantity))
      .bind(method(:sync_index))
    end
  end
end