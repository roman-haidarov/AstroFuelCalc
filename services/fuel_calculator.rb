# frozen_string_literal: true
require 'pry'

class FuelCalculator
  attr_reader :mass, :space_way

  COEFFICIENTS = { launch: [0.042, 33], land: [0.033, 42] }.freeze

  def initialize(mass:, space_way:)
    @mass = mass
    @space_way = space_way
    @fuel_amount = 0
  end

  def call
    space_way.each do |way|
      landing, gravity = way
      overall_fuel_quantity(landing.to_sym, gravity)
    end

    @fuel_amount
  end

  private

  def overall_fuel_quantity(landing, gravity)
    first_fueling = (mass * gravity * COEFFICIENTS[landing][0] - COEFFICIENTS[landing][1]).to_i
    last_fuel = 0

    while first_fueling > 40
      @fuel_amount += first_fueling if last_fuel != first_fueling
      first_fueling = (first_fueling * gravity * COEFFICIENTS[landing][0] - COEFFICIENTS[landing][1]).to_i
      @fuel_amount += first_fueling
      last_fuel = first_fueling
    end
  end
end
