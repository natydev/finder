# frozen_string_literal: true

module BoxOp
  # Creates a Box record and (eventually) do other stuff
  class Create < BaseCreator
    include ElaboratePicture
    option :model_klass, default: proc { Box }

    def call
      prepare_record
        .bind(method(:elaborate_picture))
        .bind(method(:persist_record))
    end
  end
end
