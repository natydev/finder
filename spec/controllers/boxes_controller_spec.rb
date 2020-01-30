# frozen_string_literal: true

require 'rails_helper'

RSpec.describe BoxesController, type: :controller do
  let!(:owner) { create(:user) }
  let(:spot) { create(:spot, owner: owner) }
  let!(:existant_record) { create(:box, spot: spot, owner: owner) }
  let(:valid_attributes) do
    attributes_for(:box, spot_id: spot.id)
  end
  let(:invalid_attributes) do
    attributes_for(:box, summary: '')
  end

  context 'when user is authenticated' do
    include_examples 'default_controller_success', Box, :summary
  end
  context 'when user is not authenticated' do
    include_examples 'default_controller_public', Box, :summary
  end
end
