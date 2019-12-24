module TagOp
  class Destroy < BaseDestroyer
    option :model_klass, default: proc { Tag }
  end
end