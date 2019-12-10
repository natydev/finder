class CreateAllowances < ActiveRecord::Migration[6.0]
  def change
    create_table :allowances, id: :uuid do |t|
      t.references :owner, type: :uuid, null: true, foreign_key: {to_table: :users}
      t.references :allowanceable, type: :uuid, polymorphic: true, null: false
      t.references :user, type: :uuid, null: false, foreign_key: true
      t.boolean :read
      t.boolean :create
      t.boolean :update
      t.boolean :delete

      t.timestamps
    end
  end
end
