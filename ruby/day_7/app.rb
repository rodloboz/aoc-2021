# frozen_string_literal: true

require_relative './crabs'

class Day7
  FILEPATH = '../../data/day_7/input.txt'

  def self.run
    new.run
  end

  def initialize
    load_input
  end

  def run
    fuel_cost = fuel_cost(input)
    enhanced_fuel_cost = enhanced_fuel_cost(input)

    {
      fuel_cost: fuel_cost,
      enhanced_fuel_cost: enhanced_fuel_cost
    }
  end

  private

  attr_reader :input

  def load_input
    filepath = File.expand_path(FILEPATH, File.dirname(__FILE__))
    @input = File.read(filepath).split("\n")[0].split(',').map(&:to_i)
  end
end

result = Day7.run

puts "Total fuel cost: #{result[:fuel_cost]}"
puts "Total enhanced fuel cost: #{result[:enhanced_fuel_cost]}"
