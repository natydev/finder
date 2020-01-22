class ItemsIndex < Chewy::Index
  define_type Item.includes(:item_tags) do
    field :box_id, type: 'keyword'
    field :owner_id, type: 'keyword'
    field :tags_ids, value: ->(item) { item.item_tags.map(&:tag_id) }
    field :summary, type: 'text'
    field :using, type: 'boolean'
    field :updated_at, type: 'date'
  end
end
