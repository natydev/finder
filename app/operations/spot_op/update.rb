# frozen_string_literal: true

module SpotOp
  # Updates a Spot record and (eventually) do other stuff
  class Update < BaseUpdater
    option :model_klass, default: proc { Spot }
  end
end
