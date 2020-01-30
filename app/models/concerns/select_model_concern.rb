# frozen_string_literal: true

# build 2 dimensional array for select html tag
module SelectModelConcern
  extend ActiveSupport::Concern

  class_methods do
    def as_select_options(collection)
      collection.map { |e| [e.to_s, e.id] }
    end
  end
end
