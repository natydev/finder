# frozen_string_literal: true

module ItemOp
  # Destroy a Item record and (eventually) do other stuff
  class Destroy < BaseDestroyer
    include ItemOp::BoxItemsQuantity

    option :model_klass, default: proc { Item }

    def call
      check_ownership
        .bind { destroy_record }
        .bind(method(:box_items_quantity))
    end
  end
end
