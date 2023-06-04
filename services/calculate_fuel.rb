# frozen_string_literal: true

class FuelCalculator
  attr_reader :mass, :gravity

  def initialize(mass, gravity)
    @mass = mass
    @gravity = gravity
  end

  def perform
    fuels_mass = gravity.map do |param|
      {
        fuel: (mass * param.last * 0.033 - 42).to_i,
        gravity: param.last
      }
    end

    fuels_mass.each_with_object({ fuel_amount: 0 }) do |first_fuel, fuel_amount|
      while first_fuel[:fuel] > 41
        fuel_amount[:fuel_amount] += first_fuel[:fuel]
        first_fuel[:fuel] = (first_fuel[:fuel] * first_fuel[:gravity] * 0.033 - 42).to_i
        fuel_amount[:fuel_amount] += first_fuel[:fuel]
      end
    end
  end
end
