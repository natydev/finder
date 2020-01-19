module SharedExamples
  module TimestampDeco
    RSpec.shared_examples "timestamp_deco" do
      context '#created_at_long' do
        it "return long format created_at prefixed with specific icon" do
          format_created_at = I18n.l(object.created_at, format: :long)
          expect(subject.created_at_long)
            .to eq("<i class=\"#{Icon.css_for(:time,
                    style: 'fas mr-2')}\"></i>#{format_created_at}")
        end
      end
      context '#updated_at_long' do
        it "return long format updated_at prefixed with specific icon" do
          format_updated_at = I18n.l(object.updated_at, format: :long)
          expect(subject.updated_at_long)
            .to eq("<i class=\"#{Icon.css_for(:time,
                    style: 'far mr-2')}\"></i>#{format_updated_at}")
        end
      end
    end
  end
end
