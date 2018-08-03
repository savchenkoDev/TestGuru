require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module TestGuru
  class Application < Rails::Application
    config.assets.initialize_on_precompile = false
    config.load_defaults 5.2
    config.time_zone = 'Ekaterinburg'
    config.i18n.default_locale = :ru
  end
end
