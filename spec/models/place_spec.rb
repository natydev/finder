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
    subject
    expect(described_class.for_select)
      .to eq([[subject.name, subject.id]])
  end
end
