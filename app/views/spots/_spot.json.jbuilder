# frozen_string_literal: true

json.extract! spot, :id, :place_id, :name, :code, :created_at, :updated_at
json.url spot_url(spot, format: :json)
