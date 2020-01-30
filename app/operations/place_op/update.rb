# frozen_string_literal: true

module PlaceOp
  # Updates a Place record and (eventually) do other stuff
  class Update < BaseUpdater
    option :model_klass, default: proc { Place }
  end
end
