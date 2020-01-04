require 'rails_helper'

RSpec.describe Spot, type: :model do
  let(:subject){ create(:spot) }
  let(:box){ create(:box, spot: subject) }
  it "belongs to place" do
    expect(subject.place).to be_kind_of(Place)
  end
  it "has many boxes" do
    box
    expect(subject.boxes).to eq([box])
  end
  context 'delegates' do
    it "#place_name to place" do
      expect(subject.place_name).to eq(subject.place.name)
    end
  end
  it "#to_s returns the name" do
    expect(subject.to_s).to eq(subject.name)
  end
  it ".for_select returns subarray of names and ids " do
    first_item = subject
    expect(described_class.for_select)
      .to include([first_item.name, first_item.id])
  end
  context 'Paper Trail (versioning)', versioning: true do
    it 'a spot is versioned' do
      expect(subject).to be_versioned
    end
    it "does not increment version on create" do
      subject = build(:spot)
      expect{ subject.save }.
      to_not change{ subject.versions.count }
    end
    it "increment version on update" do
      subject
      expect{ subject.update!(name: subject.name.to_s + 'mod') }.
      to change{ subject.versions.count }.by(1)
    end
    it "increment version on destroy" do
      expect{ subject.destroy }.
      to change{ subject.versions.count }.by(1)
    end
  end
end
