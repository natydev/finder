# frozen_string_literal: true

class AddItemsQuantityToBoxes < ActiveRecord::Migration[6.0]
  def change
    add_column :boxes, :items_quantity, :integer
  end
end
