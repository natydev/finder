# frozen_string_literal: true

class CreateSpots < ActiveRecord::Migration[6.0]
  def change
    create_table :spots, id: :uuid do |t|
      t.references :place, type: :uuid, null: false, foreign_key: true
      t.string :name
      t.string :slug

      t.timestamps
    end
  end
end
