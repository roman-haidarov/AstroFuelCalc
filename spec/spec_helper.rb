require 'rack/test'
require 'json'
require_relative 'helpers/request_helper'
require_relative '../app'

ENV['RACK_ENV'] = 'test'

RSpec.configure do |config|
  config.include Rack::Test::Methods

  def app
    described_class
  end
end
