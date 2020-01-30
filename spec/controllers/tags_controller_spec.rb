# frozen_string_literal: true

require 'rails_helper'

RSpec.describe TagsController, type: :controller do
  let!(:owner) { create(:user) }
  let!(:existant_record) { create(:tag, owner: owner) }
  let(:valid_attributes) do
    attributes_for(:tag)
  end
  let(:invalid_attributes) do
    attributes_for(:tag, name: '')
  end

  context 'when user is authenticated' do
    include_examples 'default_controller_success', Tag, :name
  end
  context 'when user is not authenticated' do
    include_examples 'default_controller_public', Tag, :name
  end
end
