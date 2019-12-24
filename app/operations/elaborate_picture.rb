module ElaboratePicture
  def elaborate_picture(model_object)
    Try do
      model_object.picture.present? ? model_object.picture_derivatives! : true
    end.to_result.bind do |result|
      if result
        Value(model_object)
      else
        Failure(model_object.errors)
      end
    end
  end
end