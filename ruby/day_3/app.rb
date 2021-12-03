require_relative './diagnostic'

file = File.expand_path('../../data/day_3/input.txt', File.dirname(__FILE__))
inputs = File.read(file).split

power_consumption = calculate_power_consumption(inputs)

puts "Power Consumption: #{power_consumption}"
