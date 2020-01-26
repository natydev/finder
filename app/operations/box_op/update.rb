module BoxOp
  class Update < BaseUpdater
    include ElaboratePicture
    include PersistRecord
    include BoxOp::IndexKlass
    include SyncIndex

    option :model_klass, default: proc { Box }

    def call
      check_ownership
      .bind{ update_record }
      .bind(method(:elaborate_picture))
      .bind(method(:persist_record))
      .bind(method(:sync_index))
    end
  end
end