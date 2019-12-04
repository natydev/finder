class Box < ApplicationRecord
  belongs_to :spot
  belongs_to :owner, class_name: 'User', optional: true

  delegate :name, to: :spot, prefix: true, allow_nil: true

  def to_s
    code
  end
end
