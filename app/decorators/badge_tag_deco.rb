module BadgeTagDeco
  extend ActiveSupport::Concern

  def badge_tags
    object.tags.map do |t|
      h.content_tag :span, class: 'badge badge-secondary mr-3',
                           style: cssify(color: t.color,
                           background: t.background) do
        h.raw h.content_tag(:i, '', class: 'fa fa-tag mr-1') + t.name
      end
    end.join('')
  end

  private

  def cssify(hash={})
    hash.inject([]) do |memo, object|
      memo << object.join(": ") if object.last.present?
    end.join("; ")
  rescue NoMethodError
    nil
  end
end
