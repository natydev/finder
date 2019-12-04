class Item < ApplicationRecord
  belongs_to :box

  delegate :code, to: :box, prefix: true, allow_nil: true

  def to_s
    summary
  end
end
