require 'rails_helper'

RSpec.describe BoxDecorator, type: :decorator do
  let(:object){ create(:box) }
  let(:subject){ described_class.new(object) }

  context '#badge_spot_name' do
    it "return spot name prefixed with specific icon" do
      expect(subject.badge_spot_name)
        .to eq("<i class=\"fa fa-door-open mr-1\"></i>#{object.spot_name}")
    end
  end
  context '#free_ratio' do
    context 'when object is cluster' do
      let(:object){ create(:box, :cluster) }
      it "return free_ratio value with percentage" do
        expect(subject.free_ratio)
          .to eq("#{object.free_ratio}%")
      end
    end
    context 'when object is standalone' do
      let(:object){ create(:box, :standalone) }
      it "return nil" do
        expect(subject.free_ratio).to be_nil
      end
    end
  end
  include_examples "picture_deco", :box
  include_examples "timestamp_deco"
end
