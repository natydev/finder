# frozen_string_literal: true

module ParentIconDeco
  extend ActiveSupport::Concern

  def parent_icon(attrib, icon)
    h.raw h.content_tag(:i, '', class: "fa fa-#{icon} mr-1") + object.public_send(attrib)
  end
end
