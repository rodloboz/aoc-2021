# frozen_string_literal: true

require_relative './vents'

class Day5
  FILEPATH = '../../data/day_05/input.txt'

  def self.run
    new.run
  end

  def initialize
    load_input
  end

  def run
    {
      overlaps_count: count_all_overlaps(input)
      # all_overlaps_count: count_all_overlaps(input)
    }
  end

  private

  attr_reader :input

  def load_input
    filepath = File.expand_path(FILEPATH, File.dirname(__FILE__))
    segments = File.read(filepath).split("\n").reject(&:empty?).map { |s| s.split('->') }
    @input = segments.map { |s| s.map { |p| p.strip.split(',').map(&:to_i) } }
  end
end

result = Day5.run

puts "Number of overlaping points: #{result[:overlaps_count]}"
