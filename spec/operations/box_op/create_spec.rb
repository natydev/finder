# frozen_string_literal: true

require 'rails_helper'

RSpec.describe BoxOp::Create do
  let(:current_user) { create(:user) }
  let(:spot) { create(:spot) }
  let(:box_attributes) { attributes_for(:box, spot_id: spot.id) }
  let(:subject) { described_class.call(model_params: box_attributes, owner: current_user) }
  context 'call' do
    context 'when params are valid' do
      it 'retruns a box object' do
        expect(subject.value!).to be_kind_of(Box)
      end
    end
    context 'when box params are invalid' do
      let!(:box_attributes) { attributes_for(:box, summary: '') }
      it 'retruns a box object with errors' do
        expect(subject.failure.errors).to be_present
      end
    end
  end
  context 'when box has a picture' do
    let!(:box_attributes) { attributes_for(:box, spot_id: spot.id, has_picture: true) }
    context 'when params are valid' do
      it 'retruns a box object with picture present' do
        expect(subject.value!.picture).to be_present
      end
    end
    context 'when box params are invalid' do
      let!(:box_attributes) { attributes_for(:box, summary: '') }
      it 'retruns a box object with errors' do
        expect(subject.failure.errors).to be_present
      end
    end
  end
end
