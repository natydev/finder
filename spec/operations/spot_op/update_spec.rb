require 'rails_helper'

RSpec.describe SpotOp::Update do
  let(:spot) { create(:spot) }
  let(:spot_attributes) { {name: 'modified'} }
  let(:subject) { described_class.(model_object: spot,
                  model_params: spot_attributes, owner: spot.owner) }
  context 'call' do
    context 'when owner mismatch' do
      let!(:alt_owner) { create(:user) }
      let(:subject) { described_class.(model_object: spot,
                      model_params: spot_attributes, owner: alt_owner) }
      it "retruns an error" do
        expect{ subject.failure }.to raise_error(ActiveRecord::AttributeAssignmentError)
      end
    end
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
