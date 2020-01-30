# frozen_string_literal: true

module BoxOp
  # Destroy a Box record and (eventually) do other stuff
  class Destroy < BaseDestroyer
    option :model_klass, default: proc { Box }
  end
end
