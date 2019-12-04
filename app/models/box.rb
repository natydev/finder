class Box < ApplicationRecord
  include SelectModelConcern

  belongs_to :spot
  belongs_to :owner, class_name: 'User', optional: true
  has_many :items

  delegate :name, to: :spot, prefix: true, allow_nil: true

  def self.for_select
    as_select_options(order(:summary))
  end

  def to_s
    code
  end
end
