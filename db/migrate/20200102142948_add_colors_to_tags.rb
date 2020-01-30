# frozen_string_literal: true

class AddColorsToTags < ActiveRecord::Migration[6.0]
  def change
    add_column :tags, :color, :string
    add_column :tags, :background, :string
  end
end
