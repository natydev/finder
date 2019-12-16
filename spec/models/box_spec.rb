require 'rails_helper'

RSpec.describe Box, type: :model do
  let(:subject){ create(:box, has_picture: true) }
  let(:subject_standalone){ create(:box, :standalone) }
  let(:subject_cluster){ create(:box, :cluster) }
  let(:item){ create(:item, box: subject_cluster) }

  it "belongs to spot" do
    expect(subject.spot).to be_kind_of(Spot)
  end
  it "belongs to user" do
    expect(subject.owner).to be_kind_of(User)
  end
  it "has many items" do
    item
    expect(subject_cluster.items).to eq([item])
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
    first_item = subject
    expect(described_class.for_select)
      .to include([first_item.code, first_item.id])
  end
  context 'Paper Trail (versioning)', versioning: true do
    it 'a box is versioned' do
      expect(subject).to be_versioned
    end
    it "does not increment version on create" do
      subject = build(:box)
      expect{ subject.save }.
      to_not change{ subject.versions.count }
    end
    it "increment version on update" do
      subject
      expect{ subject.update!(summary: subject.summary.to_s + 'mod') }.
      to change{ subject.versions.count }.by(1)
    end
    it "increment version on destroy" do
      expect{ subject.destroy }.
      to change{ subject.versions.count }.by(1)
    end
  end
  include_examples "picture"
end
