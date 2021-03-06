# frozen_string_literal: true

crumb :root do
  link I18n.t('common.actions.home'), root_path
end

crumb :searches do
  link I18n.t('common.actions.search'), searches_path
end

crumb :places do
  link Place.model_name.human(count: 2), places_path
end

crumb :place do |place|
  link place.to_s, place_path(place)
  parent :places
end

crumb :new_place do
  link I18n.t('common.actions.new', entity: Place.model_name.human(count: 1)), ''
  parent :places
end

crumb :spot do |place, spot|
  link(
    spot.to_s,
    polymorphic_path([place, spot])
  )
  parent place
end

crumb :new_spot do |place|
  link I18n.t('common.actions.new', entity: Spot.model_name.human(count: 1)), ''
  parent place
end

crumb :boxes do
  link Box.model_name.human(count: 2), boxes_path
end

crumb :box do |box|
  link box.to_s, box_path(box)
  parent :boxes
end

crumb :new_box do
  link I18n.t('common.actions.new', entity: Box.model_name.human(count: 1)), ''
  parent :boxes
end

crumb :item do |box, item|
  link(
    item.to_s,
    polymorphic_path([box, item])
  )
  parent box
end

crumb :new_item do |box|
  link I18n.t('common.actions.new', entity: Box.model_name.human(count: 1)), ''
  parent box
end

crumb :tags do
  link Tag.model_name.human(count: 2), tags_path
end

crumb :tag do |tag|
  link tag.to_s, tag_path(tag)
  parent :tags
end

crumb :new_tag do
  link I18n.t('common.actions.new', entity: Tag.model_name.human(count: 1)), ''
  parent :tags
end
