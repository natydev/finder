require 'dry/monads'

class BaseUpdater
  extend Dry::Initializer
  include Dry::Monads[:result]
  include Dry::Monads[:try]

  option :model_params
  option :model_object
  option :model_klass

  def self.call(**args)
    new(**args).call
  end

  def call
    persist_record
  end

  def persist_record
    Try do
      model_params.except(:owner_id, :owner)
      model_object.update(model_params)
    end.to_result.bind do |result|
      if result
        Value(model_object)
      else
        Failure(model_object.errors)
      end
    end
  end

end
