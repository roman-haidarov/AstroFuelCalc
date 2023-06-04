require_relative './../../services/fuel_calculator.rb'

RSpec.describe FuelCalculator do
  describe '#call' do
    let(:mass) { 28801 }
    let(:flight_route) {
      [
        ["launch", 9.807], 
        ["land", 1.62],
        ["launch", 1.62], 
        ["land", 9.807]
      ]
    }
    let(:expected_hash) { { fuel_amount: 29964 } }

    it 'returns the calculated fuel' do
      result = described_class.new(mass: mass, gravity: flight_route).call
      
      expect(result).to eq(expected_hash)
    end
  end
end
