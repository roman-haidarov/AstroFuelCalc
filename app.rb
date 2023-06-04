# frozen_string_literal: true

require 'sinatra/base'
require 'json'
require 'pry'
require './services/calculate_fuel'
require_relative 'fuel_request'

class MyApp < Sinatra::Base
  post '/calculate_fuel' do
    begin
      request_body = JSON.parse(request.body.read)
      fuel_request = FuelRequest.new(request_body.transform_keys(&:to_sym))

      result = FuelCalculator.new(fuel_request.mass, fuel_request.flight_route).perform

      result.to_json
    rescue Dry::Struct::Error => e
      status 400
      { error: 'Invalid request parameters', details: e.message }.to_json
    end
  end
end
