class LogoUploader < CarrierWave::Uploader::Base
  include CarrierWave::RMagick
  
  process :resize_to_fit => [112, 80]

  def extension_white_list
    %w(jpg jpeg gif png)
  end
  
  def filename
     "#{slug}-logo-#{year}#{extension}" if original_filename.present?
  end
  
  def slug
    model.slug
  end

  def year
    model.year
  end
  
  def extension
    File.extname(original_filename).downcase
  end


end
