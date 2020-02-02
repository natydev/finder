# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SpotDecorator, type: :decorator do
  let(:object) { create(:spot) }
  let(:subject) { described_class.new(object) }

  context 'badge_fullcode' do
    it 'returns place, spot and box code with icon' do
      o = '<i class="fas fa-barcode"></i> ' \
          "<small class=\"code-secondary\">#{object.place_code}-</small>" \
          "<big class=\"code-master ml-1\">#{object.code}</big>"
      expect(subject.badge_fullcode)
        .to eq(o)
    end
  end

  include_examples 'timestamp_deco'
end
