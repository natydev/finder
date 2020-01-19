# frozen_string_literal: true

# TimestampsDeco provide common decorator for\
# #created_at and #updated_at attributes
module TimestampsDeco
  extend ActiveSupport::Concern

  def created_at_long
    h.raw h.content_tag(:i, '', class: Icon.css_for(:time,
                                                    style: 'fas mr-2')) +
          h.l(object.created_at, format: :long)
  end

  def updated_at_long
    h.raw h.content_tag(:i, '', class: Icon.css_for(:time,
                                                    style: 'far mr-2')) +
          h.l(object.updated_at, format: :long)
  end
end
