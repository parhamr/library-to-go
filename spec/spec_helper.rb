# encoding: utf-8

require_relative "code_coverage"

Spork.prefork do
  # Loading more in this block will cause your tests to run faster. However,
  # if you change any configuration or code from libraries loaded here, you'll
  # need to restart spork for it take effect.
  ENV["RAILS_ENV"] ||= 'test'
  require File.expand_path("../../config/environment", __FILE__)
  require 'rspec/rails'
  require 'capybara/rails'
  require 'paperclip/matchers'
  require 'thinking_sphinx/test'
  require 'database_cleaner'
  require 'sidekiq/testing'
  require 'factory_girl'
  require 'cancan/matchers'

  # Requires supporting ruby files with custom matchers and macros, etc,
  # in spec/support/ and its subdirectories.
  Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}

  if ENV["COVERAGE"] == 'true'
    require 'simplecov'
    SimpleCov.start
  end

  VCR.configure do |c|
    c.cassette_library_dir = 'spec/fixtures/cassettes'
    c.hook_into :webmock
    c.ignore_localhost = true
    c.default_cassette_options = { record: :none }
  end

  # Allow VCR work side-by-side with webmock
  VCR.turn_off!
  # Turns VCR on then off around the VCR.use_cassette block
  VCR.extend Module.new {
    def use_cassette(*args)
      VCR.turn_on!
      super
      VCR.turn_off!
    end
  }

  RSpec.configure do |config|
    config.order = "random"
    config.mock_with :rspec
    config.use_transactional_fixtures = false
    config.include Mongoid::Matchers
    
    # Database cleaner!
    # https://gist.github.com/1793911
    config.before(:suite) do
      load "#{Rails.root}/db/seeds.rb"
      WebMock.disable_net_connect!(allow_localhost: true)
      DatabaseCleaner.orm = "mongoid"
      DatabaseCleaner["mongoid"].clean_with :truncation
      DatabaseCleaner["mongoid"].strategy = :truncation
      #load "#{Rails.root}/db/seeds.rb"
    end

    config.before(:each) do
      DatabaseCleaner["mongoid"].start
      Mongoid::IdentityMap.clear
    end

    config.after(:each) do
      DatabaseCleaner["mongoid"].clean
    end

    config.include Paperclip::Shoulda::Matchers
    config.include FactoryGirl::Syntax::Methods
    config.include Devise::TestHelpers, type: :controller
    config.include Devise::TestHelpers, type: :helper
    config.include JsonSpec::Helpers
  end
end

Spork.each_run do
  FactoryGirl.reload
  Dir["#{Rails.root}/lib/**/*.rb"].each { |lib| load lib }
  Dir["#{Rails.root}/app/models/*.rb"].each { |model| load model }
end

class ActionController::TestCase
  include Devise::TestHelpers
end
