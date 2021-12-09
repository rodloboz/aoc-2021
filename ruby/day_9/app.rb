# frozen_string_literal: true

require_relative './grid'
require 'byebug'

class Day9
  FILEPATH = '../../data/day_9/input.txt'

  def self.run
    new.run
  end

  def initialize
    load_input
  end

  def run
    grid = Grid.new(input)
    risk_level = grid.risk_level
    basin_sizes = grid.largest_basins_sizes.inject(:*)

    {
      risk_level: risk_level,
      basin_sizes: basin_sizes
    }
  end

  private

  attr_reader :input

  def load_input
    require 'byebug'
    filepath = File.expand_path(FILEPATH, File.dirname(__FILE__))
    @input = File.readlines(filepath).map do |line|
      line.strip.chars.map(&:to_i)
    end
  end
end

result = Day9.run

puts "Smoke Risk Level: #{result[:risk_level]}"
puts "Largest Basins: #{result[:basin_sizes]}"
