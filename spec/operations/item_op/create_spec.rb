require 'rails_helper'

RSpec.describe ItemOp::Create do
  let(:current_user) { create(:user) }
  let(:box) { create(:box) }
  let(:item_attributes) { attributes_for(:item, box_id: box.id) }
  let(:subject) { described_class.(model_params: item_attributes, owner: current_user) }
  context 'call' do
    context 'when params are valid' do
      it "retruns a item object" do
        expect(subject.value!).to be_kind_of(Item)
      end
      it "add index on ES" do
        expect{ subject.value! }.
        to change{ ItemsIndex::Item.count }.by(1)
      end
    end
    context 'when item params are invalid' do
      let!(:item_attributes) { attributes_for(:item, summary: '') }
      it "retruns a item object with errors" do
        expect(subject.failure.errors).to be_present
      end
    end
  end
  context 'when item has a picture' do
    let!(:item_attributes) { attributes_for(:item, box_id: box.id, has_picture: true) }
    context 'when params are valid' do
      it "retruns a item object with picture present" do
        expect(subject.value!.picture).to be_present
      end
    end
    context 'when item params are invalid' do
      let!(:item_attributes) { attributes_for(:item, summary: '') }
      it "retruns a item object with errors" do
        expect(subject.failure.errors).to be_present
      end
    end
  end
end
