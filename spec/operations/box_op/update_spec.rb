# frozen_string_literal: true

require 'rails_helper'

RSpec.describe BoxOp::Update do
  let(:box) { create(:box) }
  let(:box_attributes) { { summary: 'modified' } }
  let(:subject) do
    described_class.call(model_object: box,
                         model_params: box_attributes, owner: box.owner)
  end
  context 'call' do
    context 'when owner mismatch' do
      let!(:alt_owner) { create(:user) }
      let(:subject) do
        described_class.call(model_object: box,
                             model_params: box_attributes, owner: alt_owner)
      end
      it 'retruns an error' do
        expect { subject.failure }.to raise_error(ActiveRecord::AttributeAssignmentError)
      end
    end
    context 'when params are valid' do
      it 'returns a box object' do
        expect(subject.value!).to be_kind_of(Box)
      end
      it 'its picture is empty' do
        expect(subject.value!.picture).to be_nil
      end
    end
    context 'when box params are invalid' do
      let!(:box_attributes) { attributes_for(:box, summary: '') }
      it 'returns a box object with errors' do
        expect(subject.failure.errors).to be_present
      end
    end
    context 'when box has a picture' do
      let!(:box) { create(:box, has_picture: true) }
      let!(:set_derivatives) { box.picture_derivatives! }
      context 'when params are valid' do
        it 'returns a box object with picture present' do
          expect(subject.value!.picture).to be_present
        end
        it 'returns a box object with small picture present' do
          expect(subject.value!.picture(:small).url).to include('picture/small')
        end
        it 'returns a box object with medium picture present' do
          expect(subject.value!.picture(:medium).url).to include('picture/medium')
        end
        it 'returns a box object with large picture present' do
          expect(subject.value!.picture(:large).url).to include('picture/large')
        end
      end
      context 'when box params are invalid' do
        let!(:box_attributes) { attributes_for(:box, summary: '') }
        it 'returns a box object with errors' do
          expect(subject.failure.errors).to be_present
        end
      end
    end
  end
end
