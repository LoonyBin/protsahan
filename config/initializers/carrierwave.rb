CarrierWave.configure do |config|
  config.root = Rails.root.join('tmp')
  config.cache_dir = "uploads"

  config.fog_credentials = {
    :provider                         => 'Google',
    :google_storage_access_key_id     => 'GOOGIUVDXETQNIN3DMEE',
    :google_storage_secret_access_key => 'wL+S31Y7wf16Ea1Bd0pmivFmFi0L3l5weo2l3age'
  }
  config.fog_directory = 'protsahan'
end
