# frozen_string_literal: true

class AddNotesToBoxes < ActiveRecord::Migration[6.0]
  def change
    add_column :boxes, :notes, :string
  end
end
