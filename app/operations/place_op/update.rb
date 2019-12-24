module PlaceOp
  class Update < BaseUpdater
    option :model_klass, default: proc { Place }
  end
end