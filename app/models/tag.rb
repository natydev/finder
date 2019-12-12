class Tag < ApplicationRecord
  include SelectModelConcern

  has_many :item_tags
  has_many :items, through: :item_tags

  validates :name, presence: true

  has_paper_trail :on => [:update, :destroy]

  def self.for_select
    as_select_options(order(:name))
  end

  def to_s
    name
  end
end
