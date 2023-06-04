require_relative '../app'
require 'rack/test'
require 'pry'

RSpec.describe MyApp do
  include Rack::Test::Methods

  def app
    MyApp
  end

  let!(:flight_route) {
    [
      ["launch", 9.807], 
      ["land", 1.62],
      ["launch", 1.62], 
      ["land", 9.807]
    ]
  }

  describe 'POST /calculate_fuel' do
    it 'returns the calculated fuel' do
      post '/calculate_fuel', { mass: 28801, flight_route: flight_route }.to_json

      expect(last_response.status).to eq(200)
      expect(JSON.parse(last_response.body)).to eq({"all_fuel"=>38222}) 
    end
  end
end
