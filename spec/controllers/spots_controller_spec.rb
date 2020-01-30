# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SpotsController, type: :controller do
  before(:all) do
    @parent_record = create(:place)
  end
  let!(:owner) { create(:user) }
  let!(:existant_record) { create(:spot, place: @parent_record, owner: owner) }
  let(:valid_attributes) do
    attributes_for(:spot, place_id: @parent_record.id)
  end
  let(:invalid_attributes) do
    attributes_for(:spot, place_id: @parent_record.id, name: '')
  end

  context 'when user is authenticated' do
    include_examples 'nested_controller_success', Spot, :name
  end
  context 'when user is not authenticated' do
    include_examples 'nested_controller_public', Spot, :name
  end
end
