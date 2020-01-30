# frozen_string_literal: true

module TagOp
  # Creates a Tag record and (eventually) do other stuff
  class Create < BaseCreator
    option :model_klass, default: proc { Tag }
  end
end
