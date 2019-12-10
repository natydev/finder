require 'rails_helper'

RSpec.describe Spot, type: :model do
  let(:subject){ create(:spot) }
  it "belongs to place" do
    expect(subject.place).to be_kind_of(Place)
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
    subject
    expect(described_class.for_select)
      .to eq([[subject.name, subject.id]])
  end

end
