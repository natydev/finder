require 'rails_helper'

RSpec.describe PlaceOp::Update do
  let(:place) { create(:place) }
  let(:place_attributes) { {name: 'modified'} }
  let(:subject) { described_class.(model_object: place,
                  model_params: place_attributes, owner: place.owner) }
  context 'call' do
    context 'when owner mismatch' do
      let!(:alt_owner) { create(:user) }
      let(:subject) { described_class.(model_object: place,
                      model_params: place_attributes, owner: alt_owner) }
      it "retruns an error" do
        expect{ subject.failure }.to raise_error(ActiveRecord::AttributeAssignmentError)
      end
    end
    context 'when params are valid' do
      it "retruns a place object" do
        expect(subject.value!).to be_kind_of(Place)
      end
    end
    context 'when place params are invalid' do
      let!(:place_attributes) { attributes_for(:place, name: '') }
      it "retruns a place object with errors" do
        expect(subject.failure).to be_kind_of(ActiveModel::Errors)
      end
    end
  end
end
