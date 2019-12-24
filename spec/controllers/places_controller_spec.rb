require 'rails_helper'

RSpec.describe PlacesController, type: :controller do

  let!(:owner){ create(:user) }
  let!(:existant_record){ create(:place, owner: owner) }
  let(:valid_attributes) {
    attributes_for(:place)
  }
  let(:invalid_attributes) {
    attributes_for(:place, name: '')
  }

  context 'when user is authenticated' do
    include_examples "default_controller_success", Place, :name
  end
  context 'when user is not authenticated' do
    include_examples "default_controller_public", Place, :name
  end
end
