module SyncIndex
  def sync_index(model_object)
    Try do
      Chewy.strategy.current.update(index_class, model_object)
    end.to_result.bind do |result|
      if result
        Value(model_object)
      else
        Failure(model_object)
      end
    end
  end
end
