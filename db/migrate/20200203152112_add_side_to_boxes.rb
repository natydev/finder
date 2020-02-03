class AddSideToBoxes < ActiveRecord::Migration[6.0]
  def change
    add_column :boxes, :side, :string, limit: 4
  end
end
