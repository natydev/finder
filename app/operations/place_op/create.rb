module PlaceOp
  class Create < BaseCreator
    option :model_klass, default: proc { Place }
  end
end