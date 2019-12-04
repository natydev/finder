class Spot < ApplicationRecord
  include SelectModelConcern

  belongs_to :place

  delegate :name, to: :place, prefix: true, allow_nil: true

  def self.for_select
    as_select_options(order(:name))
  end

  def to_s
    name
  end
end
