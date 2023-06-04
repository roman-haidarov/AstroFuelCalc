require 'rack/test'
require 'json'

ENV['RACK_ENV'] = 'test'

RSpec.configure do |config|
  config.include Rack::Test::Methods

  def app
    described_class
  end
end
