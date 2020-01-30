# frozen_string_literal: true

module PlaceOp
  # Creates a Place record and (eventually) do other stuff
  class Create < BaseCreator
    option :model_klass, default: proc { Place }
  end
end
