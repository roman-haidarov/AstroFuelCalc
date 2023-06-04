require 'sinatra/base'
require 'json'
require './services/calculate_fuel'

class MyApp < Sinatra::Base
  post '/calculate_fuel' do
    request_body = JSON.parse(request.body.read)
    mass = request_body['mass'].to_i
    flight_route = request_body['flight_route']
    result = FuelCalculator.new(mass, flight_route).perform

    result.to_json
  end
end
