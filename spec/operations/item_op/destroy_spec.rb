require 'rails_helper'

RSpec.describe ItemOp::Destroy do
  let(:item) { create(:item) }
  let(:subject) { described_class.(model_object: item, owner: item.owner) }
  context 'call' do
    context 'when owner mismatch' do
      let!(:alt_owner) { create(:user) }
      let(:subject) { described_class.(model_object: item,
                      owner: alt_owner) }
      it "returns an error" do
        expect{ subject.failure }.to raise_error(ActiveRecord::AttributeAssignmentError)
      end
    end
    context 'when params are valid' do
      it "retruns a item object" do
        expect(subject.value!).to be_kind_of(Item)
      end
      context 'ES' do
        let!(:persist_item) { item }
        let!(:inc_index) { ItemsIndex.import }
        it "remove index on ES" do
          expect{ subject.value! }.
          to change{ ItemsIndex::Item.count }.by(-1)
        end
      end
    end
    context 'when item params are invalid' do
      it "retruns a an error object" do
        allow(item).to receive(:destroy).and_raise(ActiveRecord::ActiveRecordError)
        expect(subject.failure).to be_kind_of(ActiveRecord::ActiveRecordError)
      end
    end
  end
end
