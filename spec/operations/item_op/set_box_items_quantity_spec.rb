require 'rails_helper'

RSpec.describe ItemOp::SetBoxItemsQuantity do
  let(:box) { create(:box, :cluster) }
  let(:item) { create(:item, box: box, quantity: 1, owner: box.owner) }
  let(:subject) { described_class.(model_object: item) }
  context 'call' do
    context 'when item is created' do
      it "increment box.items_quantity" do
        expect{subject}.to change{
          box.items_quantity
        }.by(1)
      end
    end
    context 'when item is destroyed' do
      let!(:set_box_items_quantity) { box.update_column(:items_quantity, 1) }
      let!(:item_destroy) { item.destroy }
      it "decrement box.items_quantity" do
        expect{subject}.to change{
          box.items_quantity
        }.by(-1)
      end
    end
    context 'when item is updated' do
      let!(:box) { create(:box, :cluster) }
      let!(:set_box_items_quantity) { box.update_column(:items_quantity, 3) }
      let!(:item) { create(:item, box: box, quantity: 3, owner: box.owner) }
      context 'when quantity is incremented' do
        let!(:change_item_quantity) { item.update(quantity: 5) }
        it "increment box.items_quantity" do
          expect{subject}.to change{
            box.items_quantity
          }.by(2)
        end
      end
      context 'when quantity is decremented' do
        let!(:change_item_summary) { item.update(quantity: 1) }
        it "decrement box.items_quantity" do
          expect{subject}.to change{
            box.items_quantity
          }.by(-2)
        end
      end
      context 'when quantity is not changed' do
        let!(:change_item_summary) { item.update(summary: 'modified') }
        it "does not change box.items_quantity" do
          expect{subject}.to_not change{
            box.items_quantity
          }
        end
      end
    end
  end
end
