# frozen_string_literal: true

require 'sinatra/base'
require 'json'
require 'pry'
require './services/fuel_calculator'
require_relative 'fuel_request'

class MyApp < Sinatra::Base
  post '/calculate_fuel' do
    fuel_request = FuelRequest.new(request_body)
    FuelCalculator.new(mass: fuel_request.mass, 
                       gravity: fuel_request.flight_route)
                  .call.to_json
  rescue JSON::ParserError => e
    status 400
    { error: 'Incorrect request body', details: e.message }.to_json
  rescue Dry::Struct::Error => e
    status 400
    { error: 'Invalid request parameters', details: e.message }.to_json
  end

  private

  def request_body
    JSON.parse(request.body.read).transform_keys(&:to_sym)
  end
end
