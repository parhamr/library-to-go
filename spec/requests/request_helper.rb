# encoding: utf-8

require 'thinking_sphinx'
require 'thinking_sphinx/test'
require 'capybara/rspec'

Capybara.default_driver = :webkit
Capybara.javascript_driver = :webkit

Capybara.register_driver :rack_test do |app|
  Capybara::RackTest::Driver.new(app, :browser => :chrome)
end

path = File.join(File.dirname(__FILE__), "support")
Dir["#{path}/**/*.rb"].each do |f|
  require f
end
