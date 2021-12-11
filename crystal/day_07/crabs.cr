# frozen_string_literal: true

def fuel_cost(input : Array(Int32)) : Int32
  median = median(input)
  total_cost(input, median)
end

def median(numbers : Array(Int32)) : Int32
  sorted = numbers.sort
  size = sorted.size
  ((sorted[(size - 1) // 2] + sorted[size // 2]) // 2)
end

def enhanced_fuel_cost(input : Array(Int32)) : Int32
  cost_increase_rate = ->(n : Int32) { (n * (n + 1) // 2) }
  mean = (input.sum.to_f // input.size).to_i

  mean_cost = total_cost(input, mean, &cost_increase_rate)
  mean_cost_minus_one = total_cost(input, mean - 1, &cost_increase_rate)
  mean_plus_one_cost = total_cost(input, mean + 1, &cost_increase_rate)

  [mean_cost, mean_cost_minus_one, mean_plus_one_cost].min
end

def total_cost(numbers : Array(Int32), target : Int32) : Int32
  numbers.reduce(0) do |cost, number|
    moves = (target - number).abs
    cost + moves
  end
end

def total_cost(numbers : Array(Int32), target : Int32) : Int32
  numbers.reduce(0) do |cost, number|
    moves = (target - number).abs
    cost + yield(moves)
  end
end
