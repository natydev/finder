class ItemDecorator < Draper::Decorator
  include TimestampsDeco
  include PictureDeco

  delegate_all

  def badge_box_code
    h.raw h.content_tag(:i, '', class: 'fa fa-box mr-1') + object.box_code
  end

  def badge_tags
    object.tags.map do |t|
      h.content_tag :span, class: 'badge badge-secondary mr-3' do
        h.raw h.content_tag(:i, '', class: 'fa fa-tag mr-1') + t.name
      end
    end.join('')
  end

end
