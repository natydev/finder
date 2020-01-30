# frozen_string_literal: true

module PictureDeco
  extend ActiveSupport::Concern

  def image_tag_medium
    image_tag_picture(:medium)
  end

  def image_tag_small
    image_tag_picture(:small)
  end

private

  def image_tag_picture(size)
    h.image_tag(object.picture(size).url, class: 'img-fluid') if object.picture.present?
  rescue NoMethodError
    Rails.logger.error "Picture version not present for #{object.class} #{object.id}"
  end
end
