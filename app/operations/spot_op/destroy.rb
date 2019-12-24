module SpotOp
  class Destroy < BaseDestroyer
    option :model_klass, default: proc { Spot }
  end
end