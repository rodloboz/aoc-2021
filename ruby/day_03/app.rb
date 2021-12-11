# frozen_string_literal: true

require_relative './diagnostic'

class Day3
  FILEPATH = '../../data/day_03/input.txt'

  def self.run
    new.run
  end

  def initialize
    load_input
  end

  def run
    {
      power_consumption: power_consumption(input),
      life_support_rating: life_support_rating(input)
    }
  end

  private

  attr_reader :input

  def load_input
    filepath = File.expand_path(FILEPATH, File.dirname(__FILE__))
    @input = File.read(filepath).split
  end
end

result = Day3.run

puts "Power Consumption: #{result[:power_consumption]}"
puts "Life Support Rating: #{result[:life_support_rating]}"
