# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Tags', type: :request do
  describe 'GET /tags' do
    it 'works! (now write some real specs)' do
      get tags_path
      expect(response).to have_http_status(302)
    end
  end
end
