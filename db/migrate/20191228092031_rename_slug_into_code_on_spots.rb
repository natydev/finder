# frozen_string_literal: true

class RenameSlugIntoCodeOnSpots < ActiveRecord::Migration[6.0]
  def change
    rename_column :spots, :slug, :code
  end
end
