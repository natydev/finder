# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PlacesController, type: :routing do
  describe 'routing' do
    let!(:id) { rand_id }
    it 'routes to #index' do
      expect(get: '/places').to route_to('places#index')
    end

    it 'routes to #new' do
      expect(get: '/places/new').to route_to('places#new')
    end

    it 'routes to #show' do
      expect(get: "/places/#{id}").to route_to('places#show', id: id)
    end

    it 'routes to #edit' do
      expect(get: "/places/#{id}/edit").to route_to('places#edit', id: id)
    end

    it 'routes to #create' do
      expect(post: '/places').to route_to('places#create')
    end

    it 'routes to #update via PUT' do
      expect(put: "/places/#{id}").to route_to('places#update', id: id)
    end

    it 'routes to #update via PATCH' do
      expect(patch: "/places/#{id}").to route_to('places#update', id: id)
    end

    it 'routes to #destroy' do
      expect(delete: "/places/#{id}").to route_to('places#destroy', id: id)
    end
  end
end
