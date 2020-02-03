# frozen_string_literal: true

# Icon module: Used for mapping icon (Fontawesome) into constants.
module Icon
  extend ActiveSupport::Concern

  PLACE = 'building'
  SPOT = 'door-open'
  SIDE = 'compass'
  BOX = 'box'
  TYPOLOGY = BOX
  STANDALONE = 'square'
  CLUSTER = 'layer-group'
  ITEM = 'shapes'
  TAG = 'tag'
  USING = 'external-link-alt'
  QUANTITY = 'calculator'
  ITEMS_QUANTITY = ITEM
  PICTURE = 'camera'
  VOLUME = 'ruler-combined'
  FREE_RATIO_100 = 'battery-full'
  FREE_RATIO_75 = 'battery-three-quarters'
  FREE_RATIO_50 = 'battery-half'
  FREE_RATIO_25 = 'battery-quarter'
  FREE_RATIO_0 = 'battery-empty'
  ISSUED_ON = 'calendar-check'
  CODE = 'barcode'
  SEARCH = 'search'
  USER = 'user'
  LOG_OUT = 'power-off'
  EMAIL = 'envelope'
  PASSWORD = 'key'
  ARROW_RIGHT = 'arrow-right'
  TIME = 'clock'
  UPDATED_AT = TIME

  def self.css_for(icon, style: 'fas')
    "#{style} fa-#{Icon.const_get(icon.to_s.upcase)}"
  end
end
