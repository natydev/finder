# frozen_string_literal: true

module BadgeTagDeco
  extend ActiveSupport::Concern

  def badge_tag(tag)
    h.content_tag :span, class: 'badge badge-secondary mr-3',
                         style: cssify(color: tag.color,
                                       background: tag.background) do
      h.raw h.content_tag(:i, '', class: 'fa fa-tag mr-1') + tag.name
    end
  end

private

  def cssify(hash = {})
    hash.inject([]) do |memo, object|
      memo << object.join(': ') if object.last.present?
    end.join('; ')
  rescue NoMethodError
    nil
  end
end
