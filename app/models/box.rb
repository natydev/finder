class Box < ApplicationRecord
  include SelectModelConcern
  include UpcaseCodeCallback
  include PictureUploader::Attachment(:picture)

  belongs_to :spot
  belongs_to :owner, class_name: 'User'
  has_many :items

  delegate :name, to: :spot, prefix: true, allow_nil: true

  validates :summary, presence: true
  validates :code, presence: true, uniqueness: { scope: :owner_id },
                   length: { maximum: 10 }
  validates :typology, presence: true

  with_options if: :standalone? do |box|
    box.validates :quantity, presence: true, numericality: { only_integer: true,
      greater_than_or_equal_to: 1, less_than: 1000 }
  end

  with_options if: :cluster? do |box|
    box.validates :quantity, absence: true
  end

  after_initialize do |record|
    record.quantity = nil if record.cluster?
  end

  before_create do |record|
    record.items_quantity = 0 if record.cluster?
  end

  has_paper_trail :on => [:update, :destroy]

  has_enumeration_for :typology,
    with: BoxTypology, create_helpers: { polymorphic: true }

  scope :order_historical, -> { order(updated_at: :desc) }

  def self.for_select
    as_select_options(order(:summary))
  end

  def to_s
    code
  end
end
