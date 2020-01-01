module BadgeTagDeco
  extend ActiveSupport::Concern

  def badge_tags
    object.tags.map do |t|
      h.content_tag :span, class: 'badge badge-secondary mr-3' do
        h.raw h.content_tag(:i, '', class: 'fa fa-tag mr-1') + t.name
      end
    end.join('')
  end
end
