require 'rails_helper'

RSpec.describe Place, type: :model do
  let(:subject){ create(:place) }
  let(:spot) { create(:spot, place: subject) }
  it "has many spots" do
    spot
    expect(subject.spots).to eq([spot])
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
    it 'a place is versioned' do
      expect(subject).to be_versioned
    end
    it "does not increment version on create" do
      subject = build(:place)
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
