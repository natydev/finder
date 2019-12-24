require 'rails_helper'

RSpec.describe SpotOp::Create do
  let(:current_user) { create(:user) }
  let(:place){ create(:place) }
  let(:spot_attributes) { attributes_for(:spot, place_id: place.id) }
  let(:subject) { described_class.(model_params: spot_attributes, owner: current_user) }
  context 'call' do
    context 'when params are valid' do
      it "retruns a spot object" do
        expect(subject.value!).to be_kind_of(Spot)
      end
    end
    context 'when spot params are invalid' do
      let!(:spot_attributes) { attributes_for(:spot, name: '') }
      it "retruns a spot object with errors" do
        expect(subject.failure).to be_kind_of(ActiveModel::Errors)
      end
    end
  end
end
