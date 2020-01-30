# frozen_string_literal: true

require 'image_processing/mini_magick'

# manage upload picture (file image) inside a Box or Item model
class PictureUploader < Shrine
  Attacher.derivatives do |original|
    magick = ImageProcessing::MiniMagick.source(original)
    {
      large: magick.resize_to_limit!(900, 900),
      medium: magick.resize_to_limit!(500, 500),
      small: magick.resize_to_limit!(150, 150)
    }
  end

  Attacher.validate do
    validate_max_size 5 * 1024 * 1024, message: 'is too large (max is 5 MB)'
    validate_mime_type %w[image/jpeg image/jpg] # image/gif image/png
  end
end
