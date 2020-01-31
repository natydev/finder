# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Tag, type: :model do
  let(:subject) { create(:tag) }
  let(:item) { create(:item, tag_ids: [subject.id]) }
  it 'has many items' do
    item
    expect(subject.items).to eq([item])
  end
  it '#to_s returns the name' do
    expect(subject.to_s).to eq(subject.name)
  end
  it '.for_select returns subarray of names and ids ' do
    subject
    expect(described_class.for_select)
      .to eq([[subject.name, subject.id]])
  end
  context 'Paper Trail (versioning)', versioning: true do
    it 'a tag is versioned' do
      expect(subject).to be_versioned
    end
    it 'does not increment version on create' do
      subject = build(:tag)
      expect { subject.save }
        .to_not change { subject.versions.count }
    end
    it 'increment version on update' do
      subject
      expect { subject.update!(name: subject.name.to_s + 'mod') }
        .to change { subject.versions.count }.by(1)
    end
    it 'increment version on destroy' do
      expect { subject.destroy }
        .to change { subject.versions.count }.by(1)
    end
  end
end
