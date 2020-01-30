# frozen_string_literal: true

module SpotOp
  # Creates a Spot record and (eventually) do other stuff
  class Create < BaseCreator
    option :model_klass, default: proc { Spot }
  end
end
