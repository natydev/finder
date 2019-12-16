require 'rails_helper'

RSpec.describe ItemsController, type: :controller do

  before(:all) do
    @parent_record = create(:box, :cluster)
  end
  let!(:existant_record){ create(:item, box: @parent_record) }
  let(:valid_attributes) {
    attributes_for(:item, box_id: @parent_record.id)
  }
  let(:invalid_attributes) {
    attributes_for(:item, box_id: @parent_record.id, summary: '')
  }

  context 'when user is authenticated' do
    include_examples "nested_controller_success", Item, :summary
  end
  context 'when user is not authenticated' do
    include_examples "nested_controller_public", Item, :summary
  end

end
