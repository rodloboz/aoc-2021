# frozen_string_literal: true

require_relative './syntax_scoring'

class Day10
  FILEPATH = '../../data/day_10/input.txt'

  def self.run
    new.run
  end

  def initialize
    load_input
  end

  def run
    {
      syntax_error_score: syntax_error_score(input),
      syntax_completion_score: syntax_completion_score(input)
    }
  end

  private

  attr_reader :input

  def load_input
    filepath = File.expand_path(FILEPATH, File.dirname(__FILE__))
    @input = File.readlines(filepath).map(&:strip)
  end
end

result = Day10.run

puts "Syntax Error Score: #{result[:syntax_error_score]}"
puts "Syntax Completion Score: #{result[:syntax_completion_score]}"
