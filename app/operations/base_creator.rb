# frozen_string_literal: true

require 'dry/monads'

# Common base class for operations of kind create
class BaseCreator < OperationBase
  include PersistRecord

  option :owner
  option :model_params
  option :model_klass

  attr_reader :record

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
        Failure(record)
      end
    end
  end
end
