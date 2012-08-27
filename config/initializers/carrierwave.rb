CarrierWave.configure do |config|
  config.storage = :fog
  config.fog_credentials = {
    :provider           => 'Rackspace',
    :rackspace_username => 'bhammond',
    :rackspace_api_key  => '850842e4a357f1a0f8bdc312c32922d7'
  }
  config.fog_directory = 'dixie_direct_images'
  config.fog_host = "http://825739a6f1c024cf4cc1-3728c4e96ca6a684f463b709445875fc.r16.cf2.rackcdn.com"
end