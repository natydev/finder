# frozen_string_literal: true

require 'rails_helper'

RSpec.describe BoxOp::Destroy do
  let(:box) { create(:box) }
  let(:subject) { described_class.call(model_object: box, owner: box.owner) }
  context 'call' do
    context 'when owner mismatch' do
      let!(:alt_owner) { create(:user) }
      let(:subject) do
        described_class.call(model_object: box,
                             owner: alt_owner)
      end
      it 'retruns an error' do
        expect { subject.failure }.to raise_error(ActiveRecord::AttributeAssignmentError)
      end
    end
    context 'when params are valid' do
      it 'retruns a box object' do
        expect(subject.value!).to be_kind_of(Box)
      end
    end
    context 'when box params are invalid' do
      it 'retruns a an error object' do
        allow(box).to receive(:destroy).and_raise(ActiveRecord::ActiveRecordError)
        expect(subject.failure).to be_kind_of(ActiveRecord::ActiveRecordError)
      end
    end
  end
end
