module BoxOp
  class Update < BaseUpdater
    include ElaboratePicture
    include PersistRecord
    option :model_klass, default: proc { Box }

    def call
      check_ownership
      .bind{ update_record }
      .bind(method(:elaborate_picture))
      .bind(method(:persist_record))
    end
  end
end