# frozen_string_literal: true

# upper case #code attribute in ActiveRecord
module UpcaseCodeCallback
  extend ActiveSupport::Concern

  included do
    before_save do |record|
      record.code = record.code.upcase
    end
  end
end
