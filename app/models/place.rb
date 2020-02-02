# frozen_string_literal: true

class Place < ApplicationRecord
  include SelectModelConcern

  belongs_to :owner, class_name: 'User'
  has_many :spots, dependent: :restrict_with_error

  validates :name, presence: true
  validates :code, presence: true, uniqueness: { scope: :owner_id }

  has_paper_trail on: %i[update destroy]

  def self.for_select
    as_select_options(order(:name))
  end

  def to_s
    name
  end
end
