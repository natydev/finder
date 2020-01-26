module BoxOp
  class Create < BaseCreator
    include ElaboratePicture
    include BoxOp::IndexKlass
    include SyncIndex

    option :model_klass, default: proc { Box }

    def call
      prepare_record
      .bind(method(:persist_record))
      .bind(method(:elaborate_picture))
      .bind(method(:sync_index))
    end
  end
end