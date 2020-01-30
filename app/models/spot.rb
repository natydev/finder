# frozen_string_literal: true

class Spot < ApplicationRecord
  include UpcaseCodeCallback

  belongs_to :owner, class_name: 'User'
  belongs_to :place
  has_many :boxes

  delegate :name, to: :place, prefix: true, allow_nil: true

  validates :name, presence: true
  validates :code, presence: true, uniqueness: { scope: :place_id }

  has_paper_trail on: %i[update destroy]

  def self.for_select
    as_select_options(includes(:place).select('places.name, spots.id, spots.name').order('places.name, spots.name'))
  end

  def to_s
    name
  end

  def self.as_select_options(collection)
    collection.map { |e| ["#{e} - #{e.place}", e.id] }
  end
  private_class_method :as_select_options
end
