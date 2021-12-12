# frozen_string_literal: true

require_relative './cave_system'
require 'byebug'

class Day12
  FILEPATH = '../../data/day_12/input.txt'

  def self.run
    new.run
  end

  def initialize
    load_input
  end

  def run
    cave_system = CaveSystem.new(input)
    np1 = cave_system.simple_paths.size

    cave_system = CaveSystem.new(input)
    np2 = cave_system.complex_paths.size

    {
      np1: np1,
      np2: np2
    }
  end

  private

  attr_reader :input

  def load_input
    filepath = File.expand_path(FILEPATH, File.dirname(__FILE__))
    @input = File.readlines(filepath).map(&:strip)
  end
end

result = Day12.run

puts "Number of (simple) Paths: #{result[:np1]}"
puts "Number of (complex) Paths: #{result[:np2]}"
