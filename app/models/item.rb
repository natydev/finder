class Item < ApplicationRecord
  belongs_to :box

  delegate :code, to: :box, prefix: true, allow_nil: true
  delegate :summary, to: :box, prefix: true, allow_nil: true
  delegate :spot, to: :box, prefix: false, allow_nil: true
  delegate :spot_id, to: :box, prefix: false, allow_nil: true

  def to_s
    summary
  end
end
