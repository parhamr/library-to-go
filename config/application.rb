# encoding: utf-8

require File.expand_path('../boot', __FILE__)

#require 'rails/all'
require "action_controller/railtie"
require "action_mailer/railtie"
require "active_resource/railtie"
#require "rails/test_unit/railtie"
require "sprockets/railtie"

if defined?(Bundler)
  Bundler.require(*Rails.groups(:assets => %w(development test)))
end

module LibraryToGo
  class Application < Rails::Application
    config.autoload_paths += %W(#{Rails.root}/app/presenters)

    config.plugins = [:ssl_requirement]

    config.generators do |g|
      g.orm :mongoid
      g.template_engine :slim
      g.stylesheets false
      g.test_framework  :rspec, fixture: true
      g.fixture_replacement :factory_girl, dir: "spec/factories"
      g.view_specs false
      g.helper_specs false
    end

    #config.active_record.observers = :cacher
    config.i18n.default_locale = :en
    config.encoding = "utf-8"
    config.currency = 'USD'

    config.filter_parameters += [:password, :password_confimation]

    config.active_support.escape_html_entities_in_json = true

    #config.active_record.whitelist_attributes = true

    config.assets.enabled = true

    # Version of your assets, change this if you want to expire all your assets
    config.assets.version = '1.0'

    config.after_initialize do
      API_KEYS = YAML.load_file("#{::Rails.root}/config/api_keys.yml")[::Rails.env] unless defined?(API_KEYS) == 'constant'
    end
  end
end
