# frozen_string_literal: true

require_relative './submarine'

class Day2
  FILEPATH = '../../data/day_2/input.txt'

  def self.run
    new.run
  end

  def initialize
    load_input
  end

  def run
    simple_coordinates = calculate_position_and_depth(input)
    simple_position = simple_coordinates[:horizontal] * simple_coordinates[:depth]

    advanced_coordinates = advanced_calculate_position_and_depth(input)
    advanced_position = advanced_coordinates[:horizontal] * advanced_coordinates[:depth]

    {
      simple: {
        horizontal: simple_coordinates[:horizontal],
        depth: simple_coordinates[:depth],
        position: simple_position
      },
      advanced: {
        horizontal: advanced_coordinates[:horizontal],
        depth: advanced_coordinates[:depth],
        position: advanced_position
      }
    }
  end

  private

  attr_reader :input

  def load_input
    filepath = File.expand_path(FILEPATH, File.dirname(__FILE__))
    @input = []
    File.readlines(filepath).each do |line|
      command, value = line.split
      input << [command, value.to_i]
    end
  end
end

result = Day2.run

puts
puts '====== SIMPLE ======'
puts "Horizontal: #{result.dig(:simple, :horizontal)}"
puts "Depth: #{result.dig(:simple, :depth)}"
puts "Position: #{result.dig(:simple, :position)}"
puts
puts '===== ADVANCED ====='
puts "Horizontal: #{result.dig(:advanced, :horizontal)}"
puts "Depth: #{result.dig(:advanced, :depth)}"
puts "Position: #{result.dig(:advanced, :position)}"
