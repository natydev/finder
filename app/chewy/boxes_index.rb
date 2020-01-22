class BoxesIndex < Chewy::Index
  define_type Box.includes(:box_tags) do
    field :owner_id, type: 'keyword'
    field :spot_id, type: 'keyword'
    field :tags_ids, value: ->(box) { box.box_tags.map(&:tag_id) }
    field :summary, type: 'text'
    field :code
    field :notes, type: 'text'
    field :using, type: 'boolean'
    field :updated_at, type: 'date'
  end
end
