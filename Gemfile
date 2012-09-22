source 'http://rubygems.org'
# core
gem 'rails', '3.2.6'
gem 'rack'
gem 'nokogiri'
gem 'prawn'
gem 'sprockets'
gem 'unicorn'

# db
#gem 'pg'
gem 'mongoid'

# extension
gem 'json'

# auth/roles
gem 'devise'
gem 'devise-encryptable'
gem 'omniauth'
gem 'cancan'
gem 'cantango'

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
gem 'paper_trail'

# automation
gem 'sidekiq'
gem 'clockwork'
gem 'sinatra'

# search
gem 'thinking-sphinx'

# tag/category
gem 'acts-as-taggable-on'

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
  gem 'factory_girl'
  gem 'factory_girl_rails'
  gem 'rspec-rails'
  gem 'faker'
  gem 'thin'
end

group :test do
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
