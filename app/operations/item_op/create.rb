module ItemOp
  class Create < BaseCreator
    option :model_klass, default: proc { Item }
  end
end