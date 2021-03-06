# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PlaceOp::Update do
  let(:place) { create(:place) }
  let(:place_attributes) { { name: 'modified' } }
  let(:subject) do
    described_class.call(model_object: place,
                         model_params: place_attributes, owner: place.owner)
  end
  context 'call' do
    context 'when owner mismatch' do
      let!(:alt_owner) { create(:user) }
      let(:subject) do
        described_class.call(model_object: place,
                             model_params: place_attributes, owner: alt_owner)
      end
      it 'retruns an error' do
        expect { subject.failure }.to raise_error(ActiveRecord::AttributeAssignmentError)
      end
    end
    context 'when params are valid' do
      it 'retruns a place object' do
        expect(subject.value!).to be_kind_of(Place)
      end
    end
    context 'when place params are invalid' do
      let!(:place_attributes) { attributes_for(:place, name: '') }
      it 'retruns a place object with errors' do
        expect(subject.failure.errors).to be_present
      end
    end
  end
end
