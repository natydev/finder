# frozen_string_literal: true

module ItemOp
  # call SetBoxItemsQuantity: updates #items_quantity attribute in parent Box
  module BoxItemsQuantity
    def box_items_quantity(model_object)
      Try do
        ItemOp::SetBoxItemsQuantity.call(model_object: model_object)
      end.to_result.bind do |result|
        if result
          Value(model_object)
        else
          Failure(model_object)
        end
      end
    end
  end
end
