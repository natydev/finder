# frozen_string_literal: true

# Generate picture versions (derivatives) when picture is present
module ElaboratePicture
  def elaborate_picture(model_object)
    Try do
      model_object.picture.present? && picture_changed?(model_object) ? model_object.picture_derivatives! : true
    end.to_result.bind do |result|
      if result
        Value(model_object)
      else
        Failure(model_object)
      end
    end
  end

  def picture_changed?(obj)
    obj.picture_data_before_last_save.blank? ||
      obj.picture_data_before_last_save != obj.picture_data
  end
end
