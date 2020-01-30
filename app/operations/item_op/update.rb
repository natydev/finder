# frozen_string_literal: true

module ItemOp
  # Updates a Item record and (eventually) do other stuff
  class Update < BaseUpdater
    include ElaboratePicture
    include PersistRecord
    include ItemOp::BoxItemsQuantity

    option :model_klass, default: proc { Item }

    def call
      check_ownership
        .bind { update_record }
        .bind(method(:elaborate_picture))
        .bind(method(:box_items_quantity))
        .bind(method(:persist_record))
    end
  end
end
