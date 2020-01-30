# frozen_string_literal: true

class AddOwnerToTables < ActiveRecord::Migration[6.0]
  def change
    add_reference :places, :owner, type: :uuid, null: false
    add_reference :spots, :owner, type: :uuid, null: false
    add_reference :items, :owner, type: :uuid, null: false
    add_reference :tags, :owner, type: :uuid, null: false
  end
end
