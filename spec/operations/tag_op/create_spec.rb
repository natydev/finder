require 'rails_helper'

RSpec.describe TagOp::Create do
  let(:current_user) { create(:user) }
  let(:tag_attributes) { attributes_for(:tag) }
  let(:subject) { described_class.(model_params: tag_attributes, owner: current_user) }
  context 'call' do
    context 'when params are valid' do
      it "retruns a tag object" do
        expect(subject.value!).to be_kind_of(Tag)
      end
    end
    context 'when tag params are invalid' do
      let!(:tag_attributes) { attributes_for(:tag, name: '') }
      it "retruns a tag object with errors" do
        expect(subject.failure.errors).to be_present
      end
    end
  end
end
