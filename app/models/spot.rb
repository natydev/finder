class Spot < ApplicationRecord
  include SelectModelConcern

  belongs_to :owner, class_name: 'User'
  belongs_to :place

  delegate :name, to: :place, prefix: true, allow_nil: true

  validates :name, presence: true

  has_paper_trail :on => [:update, :destroy]

  def self.for_select
    as_select_options(order(:name))
  end

  def to_s
    name
  end
end
