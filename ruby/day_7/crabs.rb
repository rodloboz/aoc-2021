# frozen_string_literal: true

def fuel_cost(input)
  median = median(input)
  total_cost(input, median)
end

def median(numbers)
  sorted = numbers.sort
  len = sorted.length
  ((sorted[(len - 1) / 2] + sorted[len / 2]) / 2.0).floor
end

def enhanced_fuel_cost(input)
  cost_increase_rate = proc { |n| (n * (n + 1) / 2) }
  mean = (input.sum.to_f / input.size).floor

  mean_cost = total_cost(input, mean, &cost_increase_rate)
  mean_cost_minus_one = total_cost(input, mean - 1, &cost_increase_rate)
  mean_plus_one_cost = total_cost(input, mean + 1, &cost_increase_rate)

  [mean_cost, mean_cost_minus_one, mean_plus_one_cost].min
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
