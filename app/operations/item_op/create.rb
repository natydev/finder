module ItemOp
  class Create < BaseCreator
    include ElaboratePicture
    option :model_klass, default: proc { Item }

    def call
      prepare_record
      .bind(method(:elaborate_picture))
      .bind(method(:persist_record))
    end
  end
end