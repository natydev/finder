module SelectModelConcern
  extend ActiveSupport::Concern

  class_methods do
    def as_select_options(collection)
      collection.map { |e| [e.to_s, e.id] }
    end
  end
end
