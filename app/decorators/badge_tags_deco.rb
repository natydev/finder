# frozen_string_literal: true

module BadgeTagsDeco
  extend ActiveSupport::Concern
  include BadgeTagDeco

  def badge_tags
    object.tags.map do |tag|
      badge_tag(tag)
    end.join('')
  end
end
