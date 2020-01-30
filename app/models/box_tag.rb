# frozen_string_literal: true

class BoxTag < ApplicationRecord
  belongs_to :box
  belongs_to :tag
end
