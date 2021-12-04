# frozen_string_literal: true

class BoardArray
  attr_reader :score

  def initialize(numbers)
    @numbers = numbers
    @unmatched = numbers
    @matched = []
    @score = numbers.sum
  end

  def match(number)
    return unless unmatched.delete(number)

    matched << number
    @score -= number
  end

  def completed?
    unmatched.empty?
  end

  def unmatched_numbers
    @unmatched
  end

  private

  attr_reader :unmatched, :matched
end
