class AddCodePrefixNumberToBoxes < ActiveRecord::Migration[6.0]
  def change
    add_column :boxes, :code_prefix, :string, limit: 5, index: true
    add_column :boxes, :code_number, :integer, index: true
    add_index :boxes, :code_prefix
    add_index :boxes, :code_number
  end
end
