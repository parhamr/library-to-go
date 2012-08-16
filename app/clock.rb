# encoding: utf-8

require_relative "../config/boot"
require_relative "../config/environment"
require "clockwork"

module Clockwork
  every(1.day, 'name', at: '01:00') do
    Class.perform_async
  end

end
