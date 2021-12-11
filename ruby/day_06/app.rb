# frozen_string_literal: true

require_relative './lanternfish'

class Day6
  FILEPATH = '../../data/day_06/input.txt'

  def self.run
    new.run
  end

  def initialize
    load_input
  end

  def run
    lanternfish = Lanternfish.new_school(input)

    lanternfish.respawn_days(80)
    count_after80 = lanternfish.total_count

    lanternfish.respawn_days(256)
    count_after256 = lanternfish.total_count

    {
      count_after80: count_after80,
      count_after256: count_after256
    }
  end

  private

  attr_reader :input

  def load_input
    filepath = File.expand_path(FILEPATH, File.dirname(__FILE__))
    @input = File.read(filepath).split("\n")[0].split(',').map(&:to_i)
  end
end

result = Day6.run

puts "Total fish after 80 days: #{result[:count_after80]}"
puts "Total fish after 256 days: #{result[:count_after256]}"
