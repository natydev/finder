# frozen_string_literal: true

class AddQuantityToBoxesAndItems < ActiveRecord::Migration[6.0]
  def change
    add_column :boxes, :quantity, :integer, default: 1
    add_column :items, :quantity, :integer, default: 1
  end
end
