# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Icon do
  context 'constants map to icon strings' do
    it 'has PLACE' do
      expect(described_class::PLACE).to eq('building')
    end
    it 'has SPOT' do
      expect(described_class::SPOT).to eq('door-open')
    end
    it 'has BOX' do
      expect(described_class::BOX).to eq('box')
    end
    it 'has STANDALONE' do
      expect(described_class::STANDALONE).to eq('square')
    end
    it 'has CLUSTER' do
      expect(described_class::CLUSTER).to eq('layer-group')
    end
    it 'has ITEM' do
      expect(described_class::ITEM).to eq('shapes')
    end
    it 'has TAG' do
      expect(described_class::TAG).to eq('tag')
    end
    it 'has USING' do
      expect(described_class::USING).to eq('external-link-alt')
    end
    it 'has QUANTITY' do
      expect(described_class::QUANTITY).to eq('calculator')
    end
    it 'has PICTURE' do
      expect(described_class::PICTURE).to eq('camera')
    end
    it 'has VOLUME' do
      expect(described_class::VOLUME).to eq('ruler-combined')
    end
    it 'has FREE_RATIO_100' do
      expect(described_class::FREE_RATIO_100).to eq('battery-full')
    end
    it 'has FREE_RATIO_75' do
      expect(described_class::FREE_RATIO_75).to eq('battery-three-quarters')
    end
    it 'has FREE_RATIO_50' do
      expect(described_class::FREE_RATIO_50).to eq('battery-half')
    end
    it 'has FREE_RATIO_25' do
      expect(described_class::FREE_RATIO_25).to eq('battery-quarter')
    end
    it 'has FREE_RATIO_0' do
      expect(described_class::FREE_RATIO_0).to eq('battery-empty')
    end
    it 'has ISSUED_ON' do
      expect(described_class::ISSUED_ON).to eq('calendar-check')
    end
    it 'has CODE' do
      expect(described_class::CODE).to eq('barcode')
    end
    it 'has SEARCH' do
      expect(described_class::SEARCH).to eq('search')
    end
    it 'has USER' do
      expect(described_class::USER).to eq('user')
    end
    it 'has LOG_OUT' do
      expect(described_class::LOG_OUT).to eq('power-off')
    end
    it 'has EMAIL' do
      expect(described_class::EMAIL).to eq('envelope')
    end
    it 'has PASSWORD' do
      expect(described_class::PASSWORD).to eq('key')
    end
    it 'has ARROW_RIGHT' do
      expect(described_class::ARROW_RIGHT).to eq('arrow-right')
    end
  end
  context 'self.css_for(icon, style:) returns css classes for' do
    Icon.constants.map do |c|
      it "constant #{c}" do
        expect(Icon.css_for(c.to_s.underscore))
          .to eq("fas fa-#{Icon.const_get(c)}")
      end
    end
  end
end
