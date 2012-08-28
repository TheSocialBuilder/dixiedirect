class ImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::RMagick

  process :resize_to_limit => [500, 0]

  version :small do
    process :resize_to_limit => [250, 0]
  end
  
  def extension_white_list
    %w(jpg jpeg gif png)
  end
  
  def filename
     "#{slug}-ad-#{type}-#{year}-#{id}#{extension}" if original_filename.present?
  end
  
  def slug
    account = Account.find(model.account_id)
    account.slug
  end

  def year
    model.year
  end
  
  def type
    model.type
  end
  
  def id
    model.id.to_s
  end
  
  def extension
    File.extname(original_filename).downcase
  end


end
