class Spot < ApplicationRecord
  belongs_to :place

  delegate :name, to: :place, prefix: true, allow_nil: true

  def to_s
    name
  end
end
