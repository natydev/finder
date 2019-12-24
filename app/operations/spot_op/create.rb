module SpotOp
  class Create < BaseCreator
    option :model_klass, default: proc { Spot }
  end
end