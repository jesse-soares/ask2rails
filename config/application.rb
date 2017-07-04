require_relative 'boot'

require "rails"

require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "action_cable/engine"
require "sprockets/railtie"

Bundler.require(*Rails.groups)

module Ask2rails
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1

    # Don't generate system test files.
    config.generators.system_tests = nil

    config.time_zone = "Brasilia"
    config.i18n.available_locales = [:"pt-BR", :en]
    config.i18n.load_path += Dir[Rails.root.join("app/locales/**/*.{rb,yml}").to_s]
    config.i18n.default_locale = :"pt-BR"
  end
end
