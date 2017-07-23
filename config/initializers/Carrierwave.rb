CarrierWave.configure do |config|
  # config.provider = 'fog/google'                        # required

  config.fog_credentials = {
    provider:                         Rails.application.secrets.uploader_provider,
    google_storage_access_key_id:     Rails.application.secrets.google_storage_access_key_id,
    google_storage_secret_access_key: Rails.application.secrets.google_storage_secret_access_key
  }
  config.fog_directory = 'eebulle'
end