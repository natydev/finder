class CreateBoxes < ActiveRecord::Migration[6.0]
  def change
    create_table :boxes, id: :uuid do |t|
      t.references :spot, type: :uuid, null: false, foreign_key: true
      t.references :owner, type: :uuid, null: true, foreign_key: {to_table: :users}
      t.string :summary
      t.string :code
      t.date :issued_on
      t.integer :items_count, default: 0, null: false
      t.timestamps
    end
  end
end
