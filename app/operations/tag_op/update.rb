# frozen_string_literal: true

module TagOp
  # Updates a Tag record and (eventually) do other stuff
  class Update < BaseUpdater
    option :model_klass, default: proc { Tag }
  end
end
