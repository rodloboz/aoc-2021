# frozen_string_literal: true

def fuel_cost(input)
  sorted = input.sort
  half = (sorted.size / 2.to_f).floor
  total_cost(input, sorted[half])
end

def enhanced_fuel_cost(input)
  costs = {}
  (input.min..input.max).each do |target|
    costs[target] = total_cost(input, target) do |moves|
      (moves * (moves + 1) / 2)
    end
  end
  costs.values.min
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
