# frozen_string_literal: true

require 'dry/monads'

# Common base class for operations of kind update
class BaseUpdater < OperationBase
  include LogError
  include CheckOwnership

  option :model_params
  option :model_object
  option :model_klass
  option :owner

  def call
    check_ownership
      .bind { update_record }
  end

  def update_record
    Try do
      model_params.except(:owner_id, :owner)
      model_object.update(model_params)
    end.to_result.bind do |result|
      if result
        Value(model_object)
      else
        Failure(model_object)
      end
    end
  end
end
