class Place < ApplicationRecord
  include SelectModelConcern

  has_many :spots

  def self.for_select
    as_select_options(order(:name))
  end

  def to_s
    name
  end
end
