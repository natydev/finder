module ItemOp
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
        .bind(method(:update_es_index))
      end
    end

    def update_es_index(model_object)
      Try do
        Chewy.strategy.current.update(ItemsIndex, model_object)
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