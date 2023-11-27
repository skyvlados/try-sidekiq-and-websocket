require_relative "boot"

# require "rails/all"

%w(
  action_cable/engine
  action_controller/railtie
  action_mailer/railtie
  action_view/railtie
  active_job/railtie
  rails/test_unit/railtie
).each do |railtie|
  begin
    require railtie
  rescue LoadError
  end
end

if defined?(Rake.application)  && Rake.application.top_level_tasks.include?('sequel:create')
  config.sequel.skip_connect = true
end

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module SidekiqWebSocketTry
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.1

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")
  end
end
