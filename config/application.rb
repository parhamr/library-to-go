# encoding: utf-8

require File.expand_path('../boot', __FILE__)

require 'rails/all'

if defined?(Bundler)
  Bundler.require(*Rails.groups(:assets => %w(development test)))
end

module LibraryToGo
  class Application < Rails::Application
    config.plugins = [:ssl_requirement]

    #config.active_record.observers = :cacher
    config.i18n.default_locale = :en
    config.encoding = "utf-8"

    config.filter_parameters += [:password, :password_confimation]

    config.active_support.escape_html_entities_in_json = true

    config.active_record.whitelist_attributes = true

    config.assets.enabled = true

    # Version of your assets, change this if you want to expire all your assets
    config.assets.version = '1.0'

    config.after_initialize do
      API_KEYS = YAML.load_file("#{::Rails.root}/config/api_keys.yml")[::Rails.env] unless defined?(API_KEYS) == 'constant'
    end
  end
end
