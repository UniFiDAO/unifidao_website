require_relative 'boot'
require 'rails/all'
require 'airbrake-ruby'
require 'csv'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Website
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
    config.time_zone = 'Pacific Time (US & Canada)'

    config.assets.paths << Rails.root.join("app", "assets", "fonts")
  end
end

ActionView::Base.field_error_proc = proc do |html_tag, instance|
  html_tag.gsub("form-control", "form-control is-invalid").html_safe
end


Airbrake.configure do |c|
  c.project_id = 317591
  c.project_key = 'be710d46b5424587d852737e2d4eaaa0'
end

