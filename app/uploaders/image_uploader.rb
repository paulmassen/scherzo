require "image_processing/mini_magick"

class ImageUploader < Shrine
  include ImageProcessing::MiniMagick
  plugin :processing
#  plugin :versioning
  plugin :derivatives
  # plugins and uploading logic
  Attacher.derivatives_processor do |original|
      magick = ImageProcessing::MiniMagick.source(original)
      
      {
          large: magick.resize_to_limit!(800, 800),
          medium: magick.resize_to_limit!(500, 500),
          small: magick.resize_to_limit!(300, 300),
          micro: magick.resize_to_limit!(80, 80),
      }
  end
end