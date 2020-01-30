# frozen_string_literal: true

class CreateItemTags < ActiveRecord::Migration[6.0]
  def change
    create_table :item_tags, id: :uuid do |t|
      t.references :item, type: :uuid, null: false, foreign_key: true
      t.references :tag, type: :uuid, null: false, foreign_key: true

      t.timestamps
    end
  end
end
