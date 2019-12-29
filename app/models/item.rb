class Item < ApplicationRecord
  include PictureUploader::Attachment(:picture)

  belongs_to :owner, class_name: 'User'
  belongs_to :box, counter_cache: true
  has_many :item_tags, dependent: :destroy
  has_many :tags, through: :item_tags

  delegate :code, to: :box, prefix: true, allow_nil: true
  delegate :summary, to: :box, prefix: true, allow_nil: true
  delegate :spot, to: :box, prefix: false, allow_nil: true
  delegate :spot_id, to: :box, prefix: false, allow_nil: true

  validates :summary, presence: true

  has_paper_trail :on => [:update, :destroy]

  scope :order_historical, -> { order(updated_at: :desc) }

  def to_s
    summary
  end
end
