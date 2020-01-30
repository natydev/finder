# frozen_string_literal: true

# Common base class for all operations
class OperationBase
  extend Dry::Initializer
  include Dry::Monads[:result]
  include Dry::Monads[:try]

  def self.call(**args)
    new(**args).call
  end
end
