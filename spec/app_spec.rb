require_relative '../app'
require 'spec_helper'

RSpec.describe MyApp do
  let(:valid_mass) { 28801 }
  let(:valid_flight_route) {
    [
      ["launch", 9.807], 
      ["land", 1.62],
      ["launch", 1.62], 
      ["land", 9.807]
    ]
  }

  describe 'POST /calculate_fuel' do
    context 'successfully' do
      it 'returns the calculated fuel' do
        post '/calculate_fuel', { mass: valid_mass, flight_route: valid_flight_route }.to_json

        expect(response_status).to eq(200)
        expect(parsed_body).to eq(36752)
      end
    end

    context 'failure' do
      let(:invalid_mass) { "invalid_type" }
      let(:invalid_flight_route) {
        [
          ["launch", "invalid_type"], 
          ["land", 1.62],
          ["launch", 1.62], 
          ["land", 9.807]
        ]
      }

      it 'when invalid mass' do
        post '/calculate_fuel', { mass: invalid_mass, flight_route: valid_flight_route }.to_json

        expect(response_status).to eq(400)
      end

      it 'when invalid flight_route' do
        post '/calculate_fuel', { mass: valid_mass, flight_route: invalid_flight_route }.to_json

        expect(response_status).to eq(400)
      end
    end
  end
end
