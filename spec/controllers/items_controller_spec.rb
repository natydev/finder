# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ItemsController, type: :controller do
  before(:all) do
    @parent_record = create(:box, :cluster)
  end
  let!(:owner) { create(:user) }
  let!(:existant_record) { create(:item, box: @parent_record, owner: owner) }
  let(:valid_attributes) do
    attributes_for(:item, box_id: @parent_record.id)
  end
  let(:invalid_attributes) do
    attributes_for(:item, box_id: @parent_record.id, summary: '')
  end

  context 'when user is authenticated' do
    include_examples 'nested_controller_success', Item, :summary
  end
  context 'when user is not authenticated' do
    include_examples 'nested_controller_public', Item, :summary
  end
end
