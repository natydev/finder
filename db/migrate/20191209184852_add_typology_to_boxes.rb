class AddTypologyToBoxes < ActiveRecord::Migration[6.0]
  def change
    add_column :boxes, :typology, :string, limit: 3,
     comment: "available typologies are: #{ Misc.enumerate_print_list(BoxTypology) }"
    add_index  :boxes, :typology
  end
end
