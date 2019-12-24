module BoxOp
  class Destroy < BaseDestroyer
    option :model_klass, default: proc { Box }
  end
end