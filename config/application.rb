require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Qurancds
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1

    env_file = Rails.root.join("config", 'config.yml').to_s

    if File.exists?(env_file) && YAML.load_file(env_file)[Rails.env].present?
      YAML.load_file(env_file)[Rails.env].each do |key, value|
        ENV[key.to_s.upcase] = value
      end # end YAML.load_file
    end
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    config.middleware.insert_before 0, Rack::Cors do
      allow do
        origins '*'
        resource '*', headers: :any, methods: [:get, :post, :options]
      end
    end
  end
end
