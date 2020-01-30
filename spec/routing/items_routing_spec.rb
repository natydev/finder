# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ItemsController, type: :routing do
  describe 'routing' do
    let!(:id) { rand_id }
    it 'routes to #index' do
      expect(get: '/items').to route_to('items#index')
    end

    it 'does not routes to #new' do
      expect(get: '/items/new').to_not route_to('items#new')
    end

    it 'routes to #show' do
      expect(get: "/items/#{id}").to route_to('items#show', id: id)
    end

    it 'does not routes to #edit' do
      expect(get: "/items/#{id}/edit").to_not route_to('items#edit', id: id)
    end

    it 'does not routes to #create' do
      expect(post: '/items').to_not route_to('items#create')
    end

    it 'does not routes to #update via PUT' do
      expect(put: "/items/#{id}").to_not route_to('items#update', id: id)
    end

    it 'does not routes to #update via PATCH' do
      expect(patch: "/items/#{id}").to_not route_to('items#update', id: id)
    end

    it 'does not routes to #destroy' do
      expect(delete: "/items/#{id}").to_not route_to('items#destroy', id: id)
    end
  end
end
