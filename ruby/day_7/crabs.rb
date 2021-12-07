# frozen_string_literal: true

def fuel_cost(input)
  median = median(input)
  total_cost(input, median)
end

def median(array)
  sorted = array.sort
  len = sorted.length
  ((sorted[(len - 1) / 2] + sorted[len / 2]) / 2.0).floor
end

def enhanced_fuel_cost(input)
  mean = (input.sum.to_f / input.size).floor
  mean_cost = total_cost(input, mean) { |n|  (n * (n + 1) / 2) }
  mean_plus_one_cost = total_cost(input, mean + 1) { |n|  (n * (n + 1) / 2) }
  mean_cost < mean_plus_one_cost ? mean_cost : mean_plus_one_cost
end

def total_cost(numbers, target)
  numbers.reduce(0) do |cost, number|
    moves = (target - number).abs
    if block_given?
      cost + yield(moves)
    else
      cost + moves
    end
  end
end
