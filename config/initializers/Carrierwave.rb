CarrierWave.configure do |config|
  config.fog_provider = 'fog/google'                        # required

  config.fog_credentials = {
    provider:                         Rails.application.credentials.uploader_provider,
    google_storage_access_key_id:     Rails.application.credentials.google_storage_access_key_id,
    google_storage_secret_access_key: Rails.application.credentials.google_storage_secret_access_key
  }
  config.fog_directory = 'eebulle'
end
