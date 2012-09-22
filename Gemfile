source 'http://rubygems.org'
# core
gem 'rails', '3.2.8'
gem 'rack'
gem 'nokogiri'
gem 'prawn'
gem 'sprockets'
gem 'unicorn'

# db
#gem 'pg'
gem 'mongoid'
gem 'mongo'
gem 'bson'
gem 'bson_ext'

# extension
gem 'json'

# cache
gem 'hiredis'
gem 'redis', require: [ 'redis/connection/hiredis', 'redis' ]
gem 'redis-rails'

# auth/roles
gem 'devise'
gem 'devise-encryptable'
gem 'omniauth'
gem 'cancan'
#gem 'cantango'
#gem 'cantango-permits'

# media
gem 'sass'
gem 'aws-s3', :require => 'aws/s3'
gem 'aws-sdk'
gem 'paperclip'
gem 'ruport'
gem 'rmagick'

# misc
gem 'state_machine'
gem 'settingslogic'
gem 'carmen'
gem 'linefit'

# automation
gem 'sidekiq'
gem 'clockwork'
gem 'sinatra'

# search
gem 'thinking-sphinx'

# tag/category
gem 'mongoid_taggable'

# formatting/validation
gem 'date_validator'

# front end
gem 'slim-rails'
gem 'will_paginate'
gem 'jquery-rails'
gem 'linguistics'
gem 'i18n'
gem 'fb_graph'
gem 'linkedin'
gem 'calendar_date_select'
gem 'refinerycms'
gem 'formtastic'
gem 'datagrid'
gem 'rqrcode'
gem 'googlecharts'
gem 'prism'
gem 'recaptcha'
gem 'rakismet'
gem 'disqus'
gem 'acts_as_rateable'

is_buntu = `uname -a` =~ /buntu/

group :development do
  gem 'rack-contrib', :require => 'rack/contrib'
  gem 'capistrano'
  gem 'rvm-capistrano'
  gem 'capistrano-ext'
  gem 'thin'
  gem 'rails_view_annotator'
  gem 'mailcatcher'
end

group :development, :test do
  gem 'spork-rails'
  gem 'guard'
  gem 'guard-spork'
  gem 'guard-rspec'
  gem 'guard-livereload'
  gem 'terminal-notifier-guard'
  gem 'rb-fsevent'
  gem 'factory_girl'
  gem 'factory_girl_rails'
  gem 'rspec-rails'
  gem 'faker'
  gem 'thin'
end

group :test do
  gem 'mongoid-rspec'
  gem 'rspec-pride'
  gem 'webmock'
  gem 'vcr'
  gem 'shoulda-matchers'
  gem 'capybara'
  gem 'capybara-webkit'
  gem 'launchy'
  gem 'timecop'
  gem 'database_cleaner'
  gem 'simplecov', :require => false
  gem 'headless'
  gem 'json_spec'
  gem 'prickle'
end
