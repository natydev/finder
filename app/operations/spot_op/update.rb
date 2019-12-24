module SpotOp
  class Update < BaseUpdater
    option :model_klass, default: proc { Spot }
  end
end