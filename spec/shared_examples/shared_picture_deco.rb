# frozen_string_literal: true

module SharedExamples
  module PictureDeco
    RSpec.shared_examples 'picture_deco' do |kind|
      context 'image tags' do
        let(:object) { create(kind, has_picture: true) }
        context '#image_tag_medium' do
          it 'return an image_tag with medium version' do
            expect(subject.image_tag_medium)
              .to eq("<img class=\"img-fluid\" src=\"#{object.picture(:medium).url}\" />")
          end
        end
        context '#image_tag_small' do
          it 'return an image_tag with small version' do
            expect(subject.image_tag_small)
              .to eq("<img class=\"img-fluid\" src=\"#{object.picture(:small).url}\" />")
          end
        end
      end
    end
  end
end
