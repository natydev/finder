module ItemOp::BoxItemsQuantity

  def box_items_quantity(model_object)
    Try do
      ItemOp::SetBoxItemsQuantity.(model_object: model_object)
    end.to_result.bind do |result|
      if result
        Value(model_object)
      else
        Failure(model_object)
      end
    end
  end

end
