CarrierWave.configure do |config|
  config.root = Rails.root.join('tmp')
  config.cache_dir = "uploads"

  config.fog_credentials = {
    :provider                         => 'Google',
    :google_storage_access_key_id     => ENV['GOOGLE_KEY'],
    :google_storage_secret_access_key => ENV['GOOGLE_SECRET']
  }
  config.fog_directory = 'protsahan'
end
