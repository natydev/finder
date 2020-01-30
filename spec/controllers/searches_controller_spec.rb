# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SearchesController, type: :controller do
  context 'when user is authenticated' do
    before(:each) { sign_in_user }
    describe 'GET #index' do
      it 'returns a success response' do
        get :index, params: {}, session: {}
        expect(response).to be_successful
      end
    end
  end
  context 'when user is not authenticated' do
    describe 'GET #index' do
      it 'returns a redirection to login' do
        get :index, params: {}, session: {}
        expect(response).to have_http_status(:found)
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end
end
