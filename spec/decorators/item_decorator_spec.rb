# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ItemDecorator, type: :decorator do
  let(:object) { create(:item) }
  let(:subject) { described_class.new(object) }

  context 'badge_fullcode' do
    it 'returns place, spot and box code with icon' do
      o = '<i class="fas fa-barcode"></i> ' \
          "<small class=\"code-secondary\">#{object.place_code}-</small>" \
          "<small class=\"code-secondary\">#{object.spot_code}-</small>" \
          "<big class=\"code-master ml-1\">#{object.code}</big>"
      expect(subject.badge_fullcode)
        .to eq(o)
    end
  end
  context '#badge_tags' do
    context 'with color style tags' do
      let!(:tag) { create(:tag) }
      let!(:add_tags) { object.tags << tag }
      it 'return box code prefixed with specific icon' do
        expect(subject.badge_tags)
          .to eq('<span class="badge badge-secondary mr-3" style="color:' \
            " #{tag.color}; background: #{tag.background}\">" \
            '<i class="fa fa-tag mr-1"' \
            "></i>#{object.tags.first.name}</span>")
      end
    end
    context 'without color style tags' do
      let!(:add_tags) { object.tags << create(:tag, :no_style) }
      it 'return box code prefixed with specific icon' do
        expect(subject.badge_tags)
          .to eq('<span class="badge badge-secondary mr-3">' \
              "<i class=\"fa fa-tag mr-1\"></i>#{object.tags.first.name}</span>")
      end
    end
  end
  include_examples 'picture_deco', :item
  include_examples 'timestamp_deco'
end
