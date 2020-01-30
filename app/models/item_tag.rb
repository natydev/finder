# frozen_string_literal: true

class ItemTag < ApplicationRecord
  belongs_to :item
  belongs_to :tag
end
