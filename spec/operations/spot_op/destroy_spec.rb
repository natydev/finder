require 'rails_helper'

RSpec.describe SpotOp::Destroy do
  let(:spot) { create(:spot) }
  let(:subject) { described_class.(model_object: spot, owner: spot.owner) }
  context 'call' do
    context 'when owner mismatch' do
      let!(:alt_owner) { create(:user) }
      let(:subject) { described_class.(model_object: spot,
                      owner: alt_owner) }
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
      it "retruns a an error object" do
        allow(spot).to receive(:destroy).and_raise(ActiveRecord::ActiveRecordError)
        expect(subject.failure).to be_kind_of(ActiveRecord::ActiveRecordError)
      end
    end
  end
end
