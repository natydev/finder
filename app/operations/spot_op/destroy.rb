# frozen_string_literal: true

module SpotOp
  # Destroy a Spot record and (eventually) do other stuff
  class Destroy < BaseDestroyer
    option :model_klass, default: proc { Spot }
  end
end
