# frozen_string_literal: true

class Box < ApplicationRecord
  include SelectModelConcern
  include UpcaseCodeCallback
  include PictureUploader::Attachment(:picture)

  belongs_to :spot
  belongs_to :owner, class_name: 'User'
  has_many :items, dependent: :restrict_with_error
  has_many :box_tags, dependent: :destroy
  has_many :tags, through: :box_tags

  delegate :name, :code, to: :spot, prefix: true, allow_nil: true
  delegate :place_name, :place_code, to: :spot, prefix: false, allow_nil: true

  validates :summary, presence: true
  validates :code, presence: true, uniqueness: { scope: :owner_id },
                   length: { maximum: 10 }
  validates :typology, presence: true
  validates :volume, numericality: { only_integer: true, allow_nil: true }
  with_options if: :standalone? do |box|
    box.validates :quantity, presence: true, numericality: { only_integer: true,
                                                             greater_than_or_equal_to: 1, less_than: 1000 }
  end

  with_options if: :cluster? do |box|
    box.validates :free_ratio, presence: true, numericality: { only_integer: true,
                                                               greater_than_or_equal_to: 0, less_than_or_equal_to: 100 }
  end

  after_initialize do |record|
    record.quantity = nil if record.cluster?
  end

  before_create do |record|
    record.items_quantity = 0 if record.cluster?
  end

  before_save do |record|
    record.items_quantity = nil if record.standalone?
    record.free_ratio = nil if record.standalone?
    record.tags = [] if record.cluster?
  end

  has_paper_trail on: %i[update destroy]

  has_enumeration_for :typology,
                      with: BoxTypology, create_helpers: { polymorphic: true }

  scope :order_historical, -> { order(updated_at: :desc) }

  def self.for_select
    as_select_options(order(:summary))
  end

  def to_s
    code
  end

  def issued_on_human
    issued_on.present? ? I18n.l(issued_on, format: :long) : '-'
  end
end
