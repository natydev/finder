# frozen_string_literal: true

module ItemOp
  # Creates a Item record and (eventually) do other stuff
  class Create < BaseCreator
    include ElaboratePicture
    include ItemOp::BoxItemsQuantity

    option :model_klass, default: proc { Item }

    def call
      ActiveRecord::Base.transaction do
        prepare_record
          .bind(method(:persist_record))
          .bind(method(:elaborate_picture))
          .bind(method(:box_items_quantity))
      end
    end
  end
end
