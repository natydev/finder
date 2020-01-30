# frozen_string_literal: true

require 'dry/monads'

# Common base class for operations of kind destroy
class BaseDestroyer < OperationBase
  include LogError
  include CheckOwnership

  option :model_object
  option :model_klass
  option :owner

  def call
    check_ownership
      .bind { destroy_record }
  end

  def destroy_record
    Try do
      model_object.destroy
    end.to_result.bind do |result|
      if result
        Value(model_object)
      else
        Failure(model_object)
      end
    end
  end
end
