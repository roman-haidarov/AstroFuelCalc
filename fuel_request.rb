require 'dry-struct'
require 'dry-types'

module Types
  include Dry.Types()
end

class FuelRequest < Dry::Struct
  attribute :mass, Types::Coercible::Integer | Types::Coercible::Float
  attribute :flight_route, Types::Strict::Array.of(Types::Strict::Array.constructor do |arr|
    unless arr.last.is_a?(Float) || arr.last.is_a?(Integer)
      errors = [["#{arr.last}", 'Invalid type']]
      raise Dry::Struct::Error.new(errors)
    end

    arr
  end)
end
