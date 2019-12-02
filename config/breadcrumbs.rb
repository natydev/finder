# frozen_string_literal: true

crumb :root do
  link 'Home', root_path
end

crumb :places do
  link Place.model_name.human(count: 2), places_path
end

crumb :place do |place|
  link place.to_s, place_path(place)
  parent :places
end

crumb :new_place do
  link I18n.t("common.actions.new", entity: Place.model_name.human(count: 1)), ""
  parent :places
end
