import os
from math import trunc
from statistics import median, mean

def fuel_cost(input):
  mdn = median(input)
  return total_cost(input, mdn)

def enhanced_fuel_cost(input):
  cost_increase_rate = lambda n: n * (n + 1) / 2
  mean_value = round(mean(input))

  print("Total number of fish after 80 days: {}".format(mean_value))

  mean_cost = total_cost(input, mean_value, cost_increase_rate)
  mean_cost_minus_one = total_cost(input, mean_value - 1, cost_increase_rate)
  mean_plus_one_cost = total_cost(input, mean_value + 1, cost_increase_rate)


  return min([mean_cost, mean_cost_minus_one, mean_plus_one_cost])

def total_cost(numbers, target, cost_increase_rate = None):
  cost = 0
  for number in numbers:
    moves = abs(target - number)
    if cost_increase_rate:
      cost += cost_increase_rate(moves)
    else:
      cost += moves

  return cost

def main():
  dirname = os.path.dirname(__file__)
  filename = os.path.join(dirname, '../../data/day_7/input.txt')

  with open(filename) as f:
    input = f.read()

  numbers = list(map(int, input.split(',')))

  fcost = fuel_cost(numbers)
  efcost = enhanced_fuel_cost(numbers)

  print("Total Fuel Cost: {}".format(trunc(fcost)))
  print("Total Enhanced Fuel Cost: {}".format(trunc(efcost)))

if __name__ == '__main__':
    main()
