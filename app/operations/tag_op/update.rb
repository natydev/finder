module TagOp
  class Update < BaseUpdater
    option :model_klass, default: proc { Tag }
  end
end