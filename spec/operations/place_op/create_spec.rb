require 'rails_helper'

RSpec.describe PlaceOp::Create do
  let(:current_user) { create(:user) }
  let(:place_attributes) { attributes_for(:place) }
  let(:subject) { described_class.(model_params: place_attributes, owner: current_user) }
  context 'call' do
    context 'when params are valid' do
      it "retruns a place object" do
        expect(subject.value!).to be_kind_of(Place)
      end
    end
    context 'when place params are invalid' do
      let!(:place_attributes) { attributes_for(:place, name: '') }
      it "retruns a place object with errors" do
        expect(subject.failure.errors).to be_present
      end
    end
  end
end
