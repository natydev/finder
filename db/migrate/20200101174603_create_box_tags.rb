class CreateBoxTags < ActiveRecord::Migration[6.0]
  def change
    create_table :box_tags, id: :uuid do |t|
      t.references :box, type: :uuid, null: false, foreign_key: true
      t.references :tag, type: :uuid, null: false, foreign_key: true
      t.timestamps
    end
  end
end
