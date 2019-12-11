require 'rails_helper'

RSpec.describe "Spots", type: :request do
  let!(:place) { create(:place) }
  let(:spot) { create(:spot, place: place) }
  describe "GET /places/{place_id}/spots/new" do
    it do
      get new_place_spot_path(place_id: place.id)
      expect(response).to have_http_status(200)
    end
  end
  describe "GET /places/{place_id}/spots/{id}" do
    it do
      spot
      get place_spot_path(place_id: place.id, id: spot.id)
      expect(response).to have_http_status(200)
    end
  end
  describe "GET /places/{place_id}/spots/{id}/edit" do
    it do
      spot
      get edit_place_spot_path(place_id: place.id, id: spot.id)
      expect(response).to have_http_status(200)
    end
  end
end
