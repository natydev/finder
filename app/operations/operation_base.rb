class OperationBase
  extend Dry::Initializer
  include Dry::Monads[:result]
  include Dry::Monads[:try]
  
  def self.call(**args)
    new(**args).call
  end
end