require 'rails_helper'

RSpec.describe SpotsController, type: :controller do

  before(:all) do
    @parent_record = create(:place)
  end
  let!(:existant_record){ create(:spot, place: @parent_record) }
  let(:valid_attributes) {
    attributes_for(:spot, place_id: @parent_record.id)
  }
  let(:invalid_attributes) {
    attributes_for(:spot, place_id: @parent_record.id, name: '')
  }

  context 'when user is authenticated' do
    include_examples "nested_controller_success", Spot, :name
  end
  context 'when user is not authenticated' do
    include_examples "nested_controller_public", Spot, :name
  end

end
