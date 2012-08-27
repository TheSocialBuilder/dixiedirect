class ImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::RMagick

  # Thumbnail
  version :thumb do
    process :resize_to_limit => [75, 75]
  end

  version :small do
    process :resize_to_limit => [200, 200]
  end

  version :large do
    process :resize_and_pad => [500, 500]
  end


end
