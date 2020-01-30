# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Item, type: :model do
  let(:tag) { create(:tag) }
  let(:subject) { create(:item, has_picture: true) }
  let(:item_tag) { create(:item_tag, item: subject, tag: tag) }
  it 'belongs to box' do
    expect(subject.box).to be_kind_of(Box)
  end
  it 'belongs to tags' do
    item_tag
    expect(subject.tags).to eq([tag])
  end
  context 'delegates' do
    it '#box_code to box' do
      expect(subject.box_code).to eq(subject.box.code)
    end
    it '#box_summary to box' do
      expect(subject.box_summary).to eq(subject.box.summary)
    end
    it '#spot to box' do
      expect(subject.spot).to eq(subject.box.spot)
    end
    it '#spot_id to box' do
      expect(subject.spot_id).to eq(subject.box.spot_id)
    end
  end
  it '#to_s returns the summary' do
    expect(subject.to_s).to eq(subject.summary)
  end
  context 'Paper Trail (versioning)', versioning: true do
    it 'a item is versioned' do
      expect(subject).to be_versioned
    end
    it 'does not increment version on create' do
      subject = build(:item)
      expect { subject.save }
        .to_not change(subject.versions.count)
    end
    it 'increment version on update' do
      subject
      expect { subject.update!(summary: subject.summary.to_s + 'mod') }
        .to change { subject.versions.count }.by(1)
    end
    it 'increment version on destroy' do
      expect { subject.destroy }
        .to change { subject.versions.count }.by(1)
    end
  end
  include_examples 'picture'
end
