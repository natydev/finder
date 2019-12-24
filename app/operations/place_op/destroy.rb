module PlaceOp
  class Destroy < BaseDestroyer
    option :model_klass, default: proc { Place }
  end
end