# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Box, type: :model do
  let(:owner) { create(:user) }
  let(:subject) { create(:box, has_picture: true) }
  let(:subject_standalone) { create(:box, :standalone) }
  let(:subject_cluster) { create(:box, :cluster) }
  let(:item) { create(:item, box: subject_cluster) }

  it 'belongs to spot' do
    expect(subject.spot).to be_kind_of(Spot)
  end
  it 'belongs to user' do
    expect(subject.owner).to be_kind_of(User)
  end
  it 'has many items' do
    item
    expect(subject_cluster.items).to eq([item])
  end
  context 'delegates' do
    it '#spot_name to spot' do
      expect(subject.spot_name).to eq(subject.spot.name)
    end
    it '#spot_code to spot' do
      expect(subject.spot_code).to eq(subject.spot.code)
    end
    it '#place_name to spot' do
      expect(subject.place_name).to eq(subject.spot.place_name)
    end
    it '#place_code to spot' do
      expect(subject.place_code).to eq(subject.spot.place_code)
    end
  end
  context 'callbacks' do
    context 'after_initialize' do
      let(:subject) { build(:box, :cluster) }
      it 'set quantity = nil if is a cluster' do
        expect(subject.quantity).to be_nil
      end
    end
    context 'before_create' do
      it 'set items_quantity = 0 if is a cluster' do
        subject = build(:box, :cluster, items_quantity: 3)
        subject.save
        expect(subject.items_quantity).to eq(0)
      end
      context 'code_number' do
        context 'scoped on same code_prefix' do
          it 'is set to 1 when first record created' do
            subject.code_prefix = 'a'
            subject.save
            expect(subject.code_number).to eq(1)
          end
          it 'is set to 2 when 2nd record is created' do
            create(:box, owner: owner, code_prefix: 'a')
            second = create(:box, owner: owner, code_prefix: 'a')
            expect(second.code_number).to eq(2)
          end
        end
        context 'with different code_prefixes' do
          it 'is set to 1 when 2nd record is not on same code_prefix' do
            create(:box, owner: owner, code_prefix: 'a')
            second = create(:box, owner: owner, code_prefix: 'b')
            expect(second.code_number).to eq(1)
          end
        end
      end
      context 'code_prefix' do
        it 'is set to uppercased' do
          subject = build(:box, code_prefix: 'fm')
          subject.save
          expect(subject.code_prefix).to eq('FM')
        end
      end
      context 'code' do
        it 'is set as code_prefix + code_number' do
          subject = build(:box, code_prefix: 'a')
          subject.save
          expect(subject.code).to eq('A1')
        end
      end
    end
    context 'before_save' do
      context 'items_quantity' do
        it 'set nil if is a standalone' do
          expect(subject_standalone.items_quantity).to be_nil
        end
        it 'set not nil if is a cluster' do
          expect(subject_cluster.items_quantity).to_not be_nil
        end
      end
      context 'free_ratio' do
        it 'set nil if is a standalone' do
          expect(subject_standalone.free_ratio).to be_nil
        end
        it 'set not nil if is a cluster' do
          expect(subject_cluster.free_ratio).to_not be_nil
        end
      end
      context 'tags' do
        it 'set not empty if is a standalone' do
          subject_standalone.tags << create(:tag)
          subject_standalone.save
          expect(subject_standalone.tags).to_not be_empty
        end
        it 'set empty if is a cluster' do
          subject_cluster.tags << create(:tag)
          subject_cluster.save
          expect(subject_cluster.tags).to be_empty
        end
      end
    end
  end
  context 'enumerations' do
    context 'typology' do
      it 'has typology standalone' do
        expect(subject_standalone).to be_standalone
      end
      it 'has typology cluster' do
        expect(subject_cluster).to be_cluster
      end
    end
    context 'side' do
      it 'has side north' do
        expect(create(:box, side: SpotSide::NORTH)).to be_north
      end
      it 'has side north east' do
        expect(create(:box, side: SpotSide::NORTH_EAST)).to be_north_east
      end
      it 'has side east' do
        expect(create(:box, side: SpotSide::EAST)).to be_east
      end
      it 'has side south east' do
        expect(create(:box, side: SpotSide::SOUTH_EAST)).to be_south_east
      end
      it 'has side south' do
        expect(create(:box, side: SpotSide::SOUTH)).to be_south
      end
      it 'has side south west' do
        expect(create(:box, side: SpotSide::SOUTH_WEST)).to be_south_west
      end
      it 'has side west' do
        expect(create(:box, side: SpotSide::WEST)).to be_west
      end
      it 'has side north west' do
        expect(create(:box, side: SpotSide::NORTH_WEST)).to be_north_west
      end
      it 'has side central' do
        expect(create(:box, side: SpotSide::CENTRAL)).to be_central
      end
    end
  end
  context 'issued_on_metric' do
    context 'reader' do
      it 'returns today formatted dd/mm/yyyy from new record without issued_on' do
        subject = build(:box, issued_on: nil)
        expect(subject.issued_on_metric)
          .to eq(Date.today.strftime('%d/%m/%Y'))
      end
      it 'returns formatted dd/mm/yyyy from issued_on date' do
        expect(subject.issued_on_metric)
          .to eq(subject.issued_on.strftime('%d/%m/%Y'))
      end
      it 'returns nil from an empty issued_on date' do
        subject.issued_on = nil
        expect(subject.issued_on_metric)
          .to be_nil
      end
    end
    context 'writer' do
      it 'save issued_on date from formatted dd/mm/yyyy string ' do
        subject.issued_on_metric = '10/08/2017'
        expect(subject.issued_on.to_s)
          .to eq('2017-08-10')
      end
      it 'save nil from an empty or invalid date from string' do
        subject.issued_on_metric = ''
        expect(subject.issued_on)
          .to be_nil
      end
    end
  end
  it '#to_s returns the code' do
    expect(subject.to_s).to eq(subject.code)
  end
  it '.for_select returns subarray of codes and ids ' do
    first_item = subject
    expect(described_class.for_select)
      .to include([first_item.code, first_item.id])
  end
  context 'Paper Trail (versioning)', versioning: true do
    it 'a box is versioned' do
      expect(subject).to be_versioned
    end
    it 'does not increment version on create' do
      subject = build(:box)
      expect { subject.save }
        .to_not change { subject.versions.count }
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
