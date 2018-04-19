require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Eebulle
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.

    # Attempt to read encrypted secrets from `config/secrets.yml.enc`.
    # Requires an encryption key in `ENV["RAILS_MASTER_KEY"]` or
    # `config/master.key`.
    config.read_encrypted_secrets = true
    # Ensures that a master key has been made available in either ENV["RAILS_MASTER_KEY"]
    # or in config/master.key. This key is used to decrypt credentials (and other encrypted files).
    config.require_master_key = true

    config.i18n.enforce_available_locales = true
    config.i18n.default_locale = :fr

    config.generators do |g|
      g.orm             :active_record
      g.template_engine :erb
      g.stylesheets     false
      g.javascripts     false
      g.helper          false
    end

    config.exceptions_app = self.routes

    config.railties_order = [Snapuser::Engine, :main_app, :all]
  end
end
