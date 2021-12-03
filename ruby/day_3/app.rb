require_relative './diagnostic'

file = File.expand_path('../../data/day_3/input.txt', File.dirname(__FILE__))
inputs = File.read(file).split

p inputs.take(6)

power_consumption = calculate_power_consumption(inputs)
life_support_rating = calculate_life_support_rating(inputs)

puts "Power Consumption: #{power_consumption} | Life Support Rating: #{life_support_rating}"
