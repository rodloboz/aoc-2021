# frozen_string_literal: true

require_relative './sonar'

class Day1
  FILEPATH = '../../data/day_1/input.txt'

  def self.run
    new.run
  end

  def initialize
    load_input
  end

  def run
    {
      measurement_increases: measurement_increases(input),
      sliding_window_increases: sliding_window_increases(input)
    }
  end

  private

  attr_reader :input

  def load_input
    filepath = File.expand_path(FILEPATH, File.dirname(__FILE__))
    @input = File.read(filepath).split.map(&:to_i)
  end
end

result = Day1.run

puts "Measurement Increases: #{result[:measurement_increases]}"
puts "Sliding Window Increases: #{result[:sliding_window_increases]}"
