module TagOp
  class Create < BaseCreator
    option :model_klass, default: proc { Tag }
  end
end