class AddFreeRatioToBoxes < ActiveRecord::Migration[6.0]
  def change
    add_column :boxes, :free_ratio, :integer, limit: 4
  end
end
