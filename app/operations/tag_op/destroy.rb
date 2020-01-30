# frozen_string_literal: true

module TagOp
  # Destroy a Tag record and (eventually) do other stuff
  class Destroy < BaseDestroyer
    option :model_klass, default: proc { Tag }
  end
end
