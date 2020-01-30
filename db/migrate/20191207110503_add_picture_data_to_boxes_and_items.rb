# frozen_string_literal: true

class AddPictureDataToBoxesAndItems < ActiveRecord::Migration[6.0]
  def change
    add_column :boxes, :picture_data, :jsonb
    add_column :items, :picture_data, :jsonb
  end
end
