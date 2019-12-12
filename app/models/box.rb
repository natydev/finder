class Box < ApplicationRecord
  include SelectModelConcern
  include PictureUploader::Attachment(:picture)

  belongs_to :spot
  belongs_to :owner, class_name: 'User', optional: true
  has_many :items

  delegate :name, to: :spot, prefix: true, allow_nil: true

  validates :summary, presence: true
  validates :code, presence: true

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
