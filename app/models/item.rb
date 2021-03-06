# frozen_string_literal: true

class Item < ApplicationRecord
  include PictureUploader::Attachment(:picture)

  belongs_to :owner, class_name: 'User'
  belongs_to :box, counter_cache: true
  has_many :item_tags, dependent: :destroy
  has_many :tags, through: :item_tags

  delegate :code, :spot_code, :place_code, to: :box, prefix: false, allow_nil: true
  delegate :summary, :code, to: :box, prefix: true, allow_nil: true
  delegate :spot, to: :box, prefix: false, allow_nil: true
  delegate :spot_id, to: :box, prefix: false, allow_nil: true

  validates :summary, presence: true

  has_paper_trail on: %i[update destroy]

  scope :order_historical, -> { order(updated_at: :desc) }

  def to_s
    summary
  end
end
