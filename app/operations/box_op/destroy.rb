module BoxOp
  class Destroy < BaseDestroyer
    include BoxOp::IndexKlass
    include SyncIndex

    option :model_klass, default: proc { Box }

    def call
      super
      .bind(method(:sync_index))
    end
  end
end