module CheckOwnership
  def check_ownership
    Try do
      owner.id == model_object.owner_id 
    end.to_result.bind do |result|
      if result
        Success(nil)
      else
        owner_log_error
      end
    end
  end
end