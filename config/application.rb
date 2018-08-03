require_relative 'boot'

require 'rails/all'

Bundler.require(*Rails.groups)

module TestGuru
  class Application < Rails::Application
    config.load_defaults 5.2
    config.time_zone = 'Ekaterinburg'
    config.i18n.default_locale = :ru
  end
end
