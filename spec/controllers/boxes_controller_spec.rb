require 'rails_helper'

RSpec.describe BoxesController, type: :controller do

  let(:spot) { create(:spot) }
  let!(:existant_record){ create(:box, spot: spot) }
  let(:valid_attributes) {
    attributes_for(:box, spot_id: spot.id)
  }
  let(:invalid_attributes) {
    attributes_for(:box, summary: '')
  }

  context 'when user is authenticated' do
    include_examples "default_controller_success", Box, :summary
  end
  context 'when user is not authenticated' do
    include_examples "default_controller_public", Box, :summary
  end

end
