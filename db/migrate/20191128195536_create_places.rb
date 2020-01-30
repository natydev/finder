# frozen_string_literal: true

class CreatePlaces < ActiveRecord::Migration[6.0]
  def change
    create_table :places, id: :uuid do |t|
      t.string :name

      t.timestamps
    end
  end
end
