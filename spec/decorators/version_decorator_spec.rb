# frozen_string_literal: true

require 'rails_helper'

RSpec.describe VersionDecorator, type: :decorator do
  context 'Paper Trail (versioning)', versioning: true do
    let!(:object) { create(:box) }
    let!(:update_object) do
      object.update!(summary: 'modified')
    end
    let(:subject) { described_class.new(object.versions.first) }
    context 'preview' do
      it 'returns truncated summary' do
        expect(subject.preview)
          .to eq(object.summary)
      end
    end
    context 'path' do
      it 'returns box code with icon' do
        expect(subject.path)
          .to eq("/boxes/#{object.id}")
      end
    end
    context 'typology_icon' do
      context 'when is a Box kind record' do
        it 'returns truncated summary' do
          expect(subject.typology_icon)
            .to include('<i class="fas')
        end
      end
    end
  end
end
