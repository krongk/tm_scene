require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Shipei
  class Application < Rails::Application
    #auto load extras
    config.autoload_paths += %W(#{config.root}/extras)
    
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'
    
    #为了保证Ruby的时间和MySQL的时间一致，请不要设置time_zone,并设置以下内容：
    # config.time_zone = 'Central Time (US & Canada)'
    config.active_record.default_timezone = :local
    config.active_record.time_zone_aware_attributes = false 

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de
    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de
     config.before_configuration do
      I18n.locale = "zh-CN".to_sym
      I18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '**', '*.{rb,yml}')]
      I18n.reload!
    end
    config.i18n.default_locale = "zh-CN".to_sym

    # Configure the default encoding used in templates for Ruby 1.9.
    config.encoding = "utf-8"

    #custom devise layout
    config.to_prepare do
      Devise::SessionsController.layout "meflat"
      Devise::RegistrationsController.layout proc{ |controller| user_signed_in? ? "application" : "meflat" }
      Devise::ConfirmationsController.layout "meflat"
      Devise::UnlocksController.layout "meflat"            
      Devise::PasswordsController.layout "meflat"        
    end
    
  end
end
