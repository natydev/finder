# frozen_string_literal: true

require 'rails_helper'

RSpec.describe BoxesController, type: :routing do
  let!(:id) { rand_id }
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/boxes').to route_to('boxes#index')
    end

    it 'routes to #new' do
      expect(get: '/boxes/new').to route_to('boxes#new')
    end

    it 'routes to #show' do
      expect(get: "/boxes/#{id}").to route_to('boxes#show', id: id)
    end

    it 'routes to #edit' do
      expect(get: "/boxes/#{id}/edit").to route_to('boxes#edit', id: id)
    end

    it 'routes to #create' do
      expect(post: '/boxes').to route_to('boxes#create')
    end

    it 'routes to #update via PUT' do
      expect(put: "/boxes/#{id}").to route_to('boxes#update', id: id)
    end

    it 'routes to #update via PATCH' do
      expect(patch: "/boxes/#{id}").to route_to('boxes#update', id: id)
    end

    it 'routes to #destroy' do
      expect(delete: "/boxes/#{id}").to route_to('boxes#destroy', id: id)
    end
  end
end
