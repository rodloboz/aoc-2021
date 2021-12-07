# frozen_string_literal: true

def fuel_cost(input)
  sorted = input.sort
  half = (sorted.size / 2.to_f).floor
  min_l1(input, sorted[half])
end

def enhanced_fuel_cost(input)
  sorted = input.map { |n| n * (n + 1) }.sort
  half = (sorted.size / 2.to_f).floor
  min_l1(input, half) { |moves| (moves * (moves + 1) / 2) }
end

def min_l1(array, target)
  cost = 0
  array.each do |number|
    moves = (target - number).abs
    cost += block_given? ? yield(moves) : moves
  end

  cost
end
