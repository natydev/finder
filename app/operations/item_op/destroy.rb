module ItemOp
  class Destroy < BaseDestroyer
    option :model_klass, default: proc { Item }
  end
end