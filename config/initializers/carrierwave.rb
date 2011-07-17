CarrierWave.configure do |config|
  config.root = Rails.root.join('tmp')
  config.cache_dir = "uploads/cache"
end
