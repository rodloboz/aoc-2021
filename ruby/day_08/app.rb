# frozen_string_literal: true

require_relative './segment_search'
require 'byebug'
class Day8
  FILEPATH = '../../data/day_08/input.txt'

  def self.run
    new.run
  end

  def initialize
    load_input
  end

  def run
    easy_digits = count_easy_digits(input)
    decoded_entries = decode_entries(input)

    {
      easy_digits: easy_digits,
      decoded_entries: decoded_entries
    }
  end

  private

  attr_reader :input

  def load_input
    filepath = File.expand_path(FILEPATH, File.dirname(__FILE__))
    @input = File.readlines(filepath).map(&:strip)
  end
end

result = Day8.run

puts "Total number of easy digits: #{result[:easy_digits]}"
puts "Total sum of the decoded entries is: #{result[:decoded_entries]}"
