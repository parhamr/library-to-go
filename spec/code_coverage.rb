# encoding: utf-8

if ENV.has_key? "SIMPLECOV"

  class Spork
    class << self
      def prefork(&block)
        puts "yielding..."
        yield
      end
      alias :each_run :prefork
    end
  end

  require 'simplecov'
  SimpleCov.start 'rails' do
    add_filter "/spec/"
  end
else
  puts "requiring spork..."
  require 'spork'
end
