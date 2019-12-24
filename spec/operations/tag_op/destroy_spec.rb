require 'rails_helper'

RSpec.describe TagOp::Destroy do
  let(:tag) { create(:tag) }
  let(:subject) { described_class.(model_object: tag, owner: tag.owner) }
  context 'call' do
    context 'when owner mismatch' do
      let!(:alt_owner) { create(:user) }
      let(:subject) { described_class.(model_object: tag,
                      owner: alt_owner) }
      it "retruns an error" do
        expect{ subject.failure }.to raise_error(ActiveRecord::AttributeAssignmentError)
      end
    end
    context 'when params are valid' do
      it "retruns a tag object" do
        expect(subject.value!).to be_kind_of(Tag)
      end
    end
    context 'when tag params are invalid' do
      it "retruns a an error object" do
        allow(tag).to receive(:destroy).and_raise(ActiveRecord::ActiveRecordError)
        expect(subject.failure).to be_kind_of(ActiveRecord::ActiveRecordError)
      end
    end
  end
end
