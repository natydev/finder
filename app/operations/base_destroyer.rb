require 'dry/monads'

class BaseDestroyer
  extend Dry::Initializer
  include Dry::Monads[:result]
  include Dry::Monads[:try]

  option :model_object
  option :model_klass

  def self.call(**args)
    new(**args).call
  end

  def call
    destroy_record
  end

  def destroy_record
    Try do
      model_object.destroy
    end.to_result.bind do |result|
      if result
        Value(model_object)
      else
        Failure(model_object.errors)
      end
    end
  end

end
