module TimestampsDeco
  extend ActiveSupport::Concern

  def created_at_long
      h.raw h.content_tag(:i, '', class: 'far fa-clock mr-2') + 
      h.l(object.created_at, format: :long)
  end

  def updated_at_long
    h.raw h.content_tag(:i, '', class: 'far fa-clock mr-2') + 
    h.l(object.updated_at, format: :long)
  end
end