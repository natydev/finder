# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SearchDecorator, type: :decorator do
  let(:subject) { described_class.new(object) }

  context '#is_item?' do
    context "when ['box_id'] is present" do
      let!(:object) { { 'box_id' => 2 } }
      it 'returns true' do
        expect(subject).to be_is_item
      end
    end
    context "when ['box_id'] is NOT present" do
      let!(:object) { {} }
      it 'returns false' do
        expect(subject).to_not be_is_item
      end
    end
  end
  context '#item_id' do
    context "when ['item_id'] is present" do
      let!(:object) { { 'item_id' => 3 } }
      it 'returns item_id' do
        expect(subject.item_id).to eq(3)
      end
    end
    context "when ['item_id'] is NOT present" do
      let!(:object) { {} }
      it 'returns nil' do
        expect(subject.item_id).to be_nil
      end
    end
  end
  context '#picture_icon' do
    context 'when picture? is true' do
      let!(:object) { { 'box_id' => 1, 'item_picture_data' => true } }
      it 'returns an icon' do
        expect(subject.picture_icon).to include('fa-image')
      end
    end
    context 'when picture? is false' do
      let!(:object) { { 'box_id' => 1 } }
      it 'returns nil' do
        expect(subject.picture_icon).to be_nil
      end
    end
  end
  context '#picture?' do
    context 'when picture_data is present' do
      let!(:object) { { 'box_id' => 1, 'item_picture_data' => true } }
      it 'returns true' do
        expect(subject).to be_picture
      end
    end
    context 'when picture_data is not present' do
      let!(:object) { { 'box_id' => 1 } }
      it 'returns false' do
        expect(subject).to_not be_picture
      end
    end
  end
  context '#picture_data' do
    context 'when item_picture_data is present' do
      let!(:object) { { 'box_id' => 1, 'item_picture_data' => 'abc' } }
      it 'returns item_picture_data' do
        expect(subject.picture_data).to eq('abc')
      end
    end
  end
  context '#typology_icon' do
    context 'when object.typology_object.icon is present' do
      let!(:object) { create(:box) }
      it 'returns include icon tag' do
        expect(subject.typology_icon).to include('i class')
      end
    end
  end
  context 'summary' do
    context 'when is_item? true' do
      let!(:object) { { 'box_id' => 1, 'item_summary' => 'hello' } }
      it 'returns item summary' do
        expect(subject.summary).to eq('hello')
      end
    end
  end
  context 'using_strike' do
    context 'when is_item? true' do
      let!(:object) { { 'box_id' => 1 } }
      context 'when is using' do
        let!(:set_using) { object['item_using'] = true }
        it 'returns using style' do
          expect(subject.using_strike).to eq('using')
        end
      end
      context 'when is not using' do
        let!(:set_using) { object['item_using'] = false }
        it 'returns nil' do
          expect(subject.using_strike).to be_nil
        end
      end
    end
    context 'when is_item? false' do
      let!(:object) { create(:box) }
      context 'when is using' do
        let!(:set_using) { object.using = true }
        it 'returns using style' do
          expect(subject.using_strike).to eq('using')
        end
      end
      context 'when is not using' do
        let!(:set_using) { object.using = false }
        it 'returns nil' do
          expect(subject.using_strike).to be_nil
        end
      end
    end
  end
end
