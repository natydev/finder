require 'rails_helper'

RSpec.describe Box, type: :model do
  let(:subject){ create(:box) }
  let(:subject_standalone){ create(:box_standalone) }
  let(:subject_cluster){ create(:box_cluster) }
  let(:item){ create(:item, box: subject_cluster) }
  it "belongs to spot" do
    expect(subject.spot).to be_kind_of(Spot)
  end
  it "belongs to user" do
    expect(subject.owner).to be_kind_of(User)
  end
  it "has many items" do
    item
    expect(box_cluster.items).to eq([item])
  end
  context 'delegates' do
    it "#spot_name to spot" do
      expect(subject.spot_name).to eq(subject.spot.name)
    end
  end
  context 'enumerations' do
    it "has typology standalone" do
      expect(subject_standalone).to be_standalone
    end
    it "has typology cluster" do
      expect(subject_cluster).to be_cluster
    end
  end
  it "#to_s returns the code" do
    expect(subject.to_s).to eq(subject.code)
  end
  it ".for_select returns subarray of codes and ids " do
    subject
    expect(described_class.for_select)
      .to eq([[subject.code, subject.id]])
  end
end
