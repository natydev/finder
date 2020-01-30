# frozen_string_literal: true

module PlaceOp
  # Destroy a Place record and (eventually) do other stuff
  class Destroy < BaseDestroyer
    option :model_klass, default: proc { Place }
  end
end
