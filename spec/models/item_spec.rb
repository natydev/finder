require 'rails_helper'

RSpec.describe Item, type: :model do
  let(:tag){ create(:tag) }
  let(:subject){ create(:item) }
  let(:item_tag){ create(:item_tag, item: subject, tag: tag) }
  it "belongs to box" do
    expect(subject.box).to be_kind_of(Box)
  end
  it "belongs to tags" do
    item_tag
    expect(subject.tags).to eq([tag])
  end
  context 'delegates' do
    it "#box_code to box" do
      expect(subject.box_code).to eq(subject.box.code)
    end
    it "#box_summary to box" do
      expect(subject.box_summary).to eq(subject.box.summary)
    end
    it "#spot to box" do
      expect(subject.spot).to eq(subject.box.spot)
    end
    it "#spot_id to box" do
      expect(subject.spot_id).to eq(subject.box.spot_id)
    end
  end
  it "#to_s returns the summary" do
    expect(subject.to_s).to eq(subject.summary)
  end
end
