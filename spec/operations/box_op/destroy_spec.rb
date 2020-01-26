require 'rails_helper'

RSpec.describe BoxOp::Destroy do
  let(:box) { create(:box) }
  let(:subject) { described_class.(model_object: box, owner: box.owner) }
  context 'call' do
    context 'when owner mismatch' do
      let!(:alt_owner) { create(:user) }
      let(:subject) { described_class.(model_object: box,
                      owner: alt_owner) }
      it "retruns an error" do
        expect{ subject.failure }.to raise_error(ActiveRecord::AttributeAssignmentError)
      end
    end
    context 'when params are valid' do
      it "retruns a box object" do
        expect(subject.value!).to be_kind_of(Box)
      end
      context 'ES' do
        let!(:persist_box) { box }
        let!(:inc_index) { BoxesIndex.import }
        it "remove index on ES" do
          expect{ subject.value! }.
          to change{ BoxesIndex::Box.count }.by(-1)
        end
      end
    end
    context 'when box params are invalid' do
      it "retruns a an error object" do
        allow(box).to receive(:destroy).and_raise(ActiveRecord::ActiveRecordError)
        expect(subject.failure).to be_kind_of(ActiveRecord::ActiveRecordError)
      end
    end
  end
end
