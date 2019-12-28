module UpcaseCodeCallback
  extend ActiveSupport::Concern

  included do
    before_save do |record|
      record.code = record.code.upcase
    end
  end
end
