# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SpotsController, type: :routing do
  describe 'routing' do
    let!(:place_id) { rand_id }
    let!(:id) { rand_id }

    it 'routes to #new' do
      expect(get: "places/#{place_id}/spots/new")
        .to route_to('spots#new', place_id: place_id)
    end

    it 'routes to #show' do
      expect(get: "places/#{place_id}/spots/#{id}")
        .to route_to('spots#show', id: id, place_id: place_id)
    end

    it 'routes to #edit' do
      expect(get: "places/#{place_id}/spots/#{id}/edit")
        .to route_to('spots#edit', id: id, place_id: place_id)
    end

    it 'routes to #create' do
      expect(post: "places/#{place_id}/spots")
        .to route_to('spots#create', place_id: place_id)
    end

    it 'routes to #update via PUT' do
      expect(put: "places/#{place_id}/spots/#{id}")
        .to route_to('spots#update', id: id, place_id: place_id)
    end

    it 'routes to #update via PATCH' do
      expect(patch: "places/#{place_id}/spots/#{id}")
        .to route_to('spots#update', id: id, place_id: place_id)
    end

    it 'routes to #destroy' do
      expect(delete: "places/#{place_id}/spots/#{id}")
        .to route_to('spots#destroy', id: id, place_id: place_id)
    end
  end
end
