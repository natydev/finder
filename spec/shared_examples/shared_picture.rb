# frozen_string_literal: true

module SharedExamples
  module Picture
    RSpec.shared_examples 'picture' do
      context 'picture' do
        let(:picture)     { subject.picture }
        let(:derivatives) { subject.picture_derivatives }
        it 'extracts metadata' do
          expect(picture.mime_type).to eq('image/jpeg')
          expect(picture.extension).to eq('jpg')
          expect(picture.size).to be_instance_of(Integer)
        end
        it 'generates derivatives' do
          expect(derivatives[:small]).to  be_kind_of(Shrine::UploadedFile)
          expect(derivatives[:medium]).to be_kind_of(Shrine::UploadedFile)
          expect(derivatives[:large]).to  be_kind_of(Shrine::UploadedFile)
        end
      end
    end
  end
end
