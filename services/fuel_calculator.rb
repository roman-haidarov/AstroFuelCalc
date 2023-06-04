# frozen_string_literal: true

class FuelCalculator
  attr_reader :mass, :gravity

  def initialize(mass:, gravity:)
    @mass = mass
    @gravity = gravity
  end

  def call
    overall_fuel_quantity(fuels_mass)
  end

  private

  def fuels_mass
    gravity.map do |param|
      {
        fuel: (mass * param.last.to_f * 0.033 - 42).to_i,
        gravity: param.last.to_f
      }
    end
  end

  def overall_fuel_quantity(fuels_mass)
    fuels_mass.each_with_object({ fuel_amount: 0 }) do |first_fuel, fuel_amount|
      last_fuel = 0
      while first_fuel[:fuel] > 40
        fuel_amount[:fuel_amount] += first_fuel[:fuel] if last_fuel != first_fuel[:fuel]
        first_fuel[:fuel] = (first_fuel[:fuel] * first_fuel[:gravity] * 0.033 - 42).to_i
        fuel_amount[:fuel_amount] += first_fuel[:fuel]
        last_fuel = first_fuel[:fuel]
      end
    end
  end
end
