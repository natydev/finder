require 'dry/monads'

class BaseCreator
  extend Dry::Initializer
  include Dry::Monads[:result]
  include Dry::Monads[:try]
  include PersistRecord

  option :owner
  option :model_params
  option :model_klass

  attr_reader :record

  def self.call(**args)
    new(**args).call
  end

  def call
    prepare_record
    .bind(method(:persist_record))
  end

  def prepare_record
    Try do
      @record = model_klass.new(model_params)
      record.owner = owner
    end.to_result.bind do |result|
      if result
        Value(record)
      else
        Failure(record.errors)
      end
    end
  end

end
