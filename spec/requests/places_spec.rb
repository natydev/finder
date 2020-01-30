# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Places', type: :request do
  describe 'GET /places' do
    it 'works! (now write some real specs)' do
      get places_path
      expect(response).to have_http_status(302)
    end
  end
end
