# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ItemOp::Update do
  let(:item) { create(:item) }
  let(:item_attributes) { { summary: 'modified' } }
  let(:subject) do
    described_class.call(model_object: item,
                         model_params: item_attributes, owner: item.owner)
  end
  context 'call' do
    context 'when owner mismatch' do
      let!(:alt_owner) { create(:user) }
      let(:subject) do
        described_class.call(model_object: item,
                             model_params: item_attributes, owner: alt_owner)
      end
      it 'retruns an error' do
        expect { subject.failure }.to raise_error(ActiveRecord::AttributeAssignmentError)
      end
    end
    context 'when params are valid' do
      it 'returns a item object' do
        expect(subject.value!).to be_kind_of(Item)
      end
      it 'its picture is empty' do
        expect(subject.value!.picture).to be_nil
      end
    end
    context 'when item params are invalid' do
      let!(:item_attributes) { attributes_for(:item, summary: '') }
      it 'returns a item object with errors' do
        expect(subject.failure.errors).to be_present
      end
    end
    context 'when item has a picture' do
      let!(:item) { create(:item, has_picture: true) }
      let!(:set_derivatives) { item.picture_derivatives! }
      context 'when params are valid' do
        it 'returns a item object with picture present' do
          expect(subject.value!.picture).to be_present
        end
        it 'returns a item object with small picture present' do
          expect(subject.value!.picture(:small).url).to include('picture/small')
        end
        it 'returns a item object with medium picture present' do
          expect(subject.value!.picture(:medium).url).to include('picture/medium')
        end
        it 'returns a item object with large picture present' do
          expect(subject.value!.picture(:large).url).to include('picture/large')
        end
      end
      context 'when item params are invalid' do
        let!(:item_attributes) { attributes_for(:item, summary: '') }
        it 'returns a item object with errors' do
          expect(subject.failure.errors).to be_present
        end
      end
    end
  end
end
