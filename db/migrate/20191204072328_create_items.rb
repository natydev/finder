# frozen_string_literal: true

class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items, id: :uuid do |t|
      t.references :box, type: :uuid, null: false, foreign_key: true
      t.string :summary

      t.timestamps
    end
  end
end
