# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SpotOp::Update do
  let(:spot) { create(:spot) }
  let(:spot_attributes) { { name: 'modified' } }
  let(:subject) do
    described_class.call(model_object: spot,
                         model_params: spot_attributes, owner: spot.owner)
  end
  context 'call' do
    context 'when owner mismatch' do
      let!(:alt_owner) { create(:user) }
      let(:subject) do
        described_class.call(model_object: spot,
                             model_params: spot_attributes, owner: alt_owner)
      end
      it 'retruns an error' do
        expect { subject.failure }.to raise_error(ActiveRecord::AttributeAssignmentError)
      end
    end
    context 'when params are valid' do
      it 'retruns a spot object' do
        expect(subject.value!).to be_kind_of(Spot)
      end
    end
    context 'when spot params are invalid' do
      let!(:spot_attributes) { attributes_for(:spot, name: '') }
      it 'retruns a spot object with errors' do
        expect(subject.failure.errors).to be_present
      end
    end
  end
end
