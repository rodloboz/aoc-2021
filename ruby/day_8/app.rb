# frozen_string_literal: true

require_relative './segment_search'

class Day8
  FILEPATH = '../../data/day_8/input.txt'

  def self.run
    new.run
  end

  def initialize
    load_input
  end

  def run
    easy_digits = count_easy_digits(input)

    {
      easy_digits: easy_digits
    }
  end

  private

  attr_reader :input

  def load_input
    filepath = File.expand_path(FILEPATH, File.dirname(__FILE__))
    @input = File.read(filepath)
  end
end

result = Day8.run

puts "Total number of easy digits: #{result[:easy_digits]}"
