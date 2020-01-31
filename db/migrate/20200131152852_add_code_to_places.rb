class AddCodeToPlaces < ActiveRecord::Migration[6.0]
  def change
    add_column :places, :code, :string
  end
end
