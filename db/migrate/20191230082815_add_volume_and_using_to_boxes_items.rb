# frozen_string_literal: true

class AddVolumeAndUsingToBoxesItems < ActiveRecord::Migration[6.0]
  def change
    add_column :boxes, :volume, :integer
    add_column :boxes, :using, :boolean
    add_column :items, :using, :boolean
  end
end
