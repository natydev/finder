# frozen_string_literal: true

require 'rails_helper'

RSpec.describe TagOp::Update do
  let(:tag) { create(:tag) }
  let(:tag_attributes) { { name: 'modified' } }
  let(:subject) do
    described_class.call(model_object: tag,
                         model_params: tag_attributes, owner: tag.owner)
  end
  context 'call' do
    context 'when owner mismatch' do
      let!(:alt_owner) { create(:user) }
      let(:subject) do
        described_class.call(model_object: tag,
                             model_params: tag_attributes, owner: alt_owner)
      end
      it 'retruns an error' do
        expect { subject.failure }.to raise_error(ActiveRecord::AttributeAssignmentError)
      end
    end
    context 'when params are valid' do
      it 'retruns a tag object' do
        expect(subject.value!).to be_kind_of(Tag)
      end
    end
    context 'when tag params are invalid' do
      let!(:tag_attributes) { attributes_for(:tag, name: '') }
      it 'retruns a tag object with errors' do
        expect(subject.failure.errors).to be_present
      end
    end
  end
end
