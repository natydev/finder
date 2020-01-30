# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  let(:subject) { create(:user) }
  context 'Paper Trail (versioning)', versioning: true do
    it 'a user is versioned' do
      expect(subject).to be_versioned
    end
    it 'does not increment version on create' do
      subject = build(:user)
      expect { subject.save }
        .to_not change(subject.versions.count)
    end
    it 'increment version on update' do
      subject
      expect { subject.update!(full_name: subject.full_name.to_s + 'mod') }
        .to change { subject.versions.count }.by(1)
    end
    it 'increment version on destroy' do
      expect { subject.destroy }
        .to change { subject.versions.count }.by(1)
    end
  end
end
