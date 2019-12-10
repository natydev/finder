class Item < ApplicationRecord
  include PictureUploader::Attachment(:picture)

  belongs_to :box, counter_cache: true
  has_many :item_tags
  has_many :tags, through: :item_tags

  delegate :code, to: :box, prefix: true, allow_nil: true
  delegate :summary, to: :box, prefix: true, allow_nil: true
  delegate :spot, to: :box, prefix: false, allow_nil: true
  delegate :spot_id, to: :box, prefix: false, allow_nil: true

  scope :order_historical, -> { order(updated_at: :desc) }

  def to_s
    summary
  end
end
