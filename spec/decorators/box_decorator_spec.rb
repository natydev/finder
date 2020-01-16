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
  context '#badge_place_name' do
    it "return place name prefixed with specific icon" do
      expect(subject.badge_place_name)
        .to eq("<i class=\"fa fa-building mr-1\"></i>#{object.place_name}")
    end
  end
  context '#badge_typology' do
    it "return typology humanized prefixed with its icon" do
      expect(subject.badge_typology)
        .to eq("<i class=\"fa fa-#{object.typology_object.icon} mr-1\"></i>#{object.typology_humanize}")
    end
  end
  context '#badge_issued_on' do
    it "return issued_on time prefixed with specific icon" do
      expect(subject.badge_issued_on)
        .to eq("<i class=\"fa fa-calendar-check mr-1\"></i>#{object.issued_on_human}")
    end
  end
  context '#free_ratio_human' do
    context 'when object is cluster' do
      let(:object){ create(:box, :cluster) }
      it "return free_ratio value with percentage" do
        expect(subject.free_ratio_human)
          .to eq("#{object.free_ratio}%")
      end
    end
    context 'when object is standalone' do
      let(:object){ create(:box, :standalone) }
      it "return nil" do
        expect(subject.free_ratio_human).to be_nil
      end
    end
  end
  include_examples "picture_deco", :box
  include_examples "timestamp_deco"
end
