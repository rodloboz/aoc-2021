require "./crabs"

filepath = File.expand_path("../../data/day_07/input.txt")
input = File.read(filepath).split("\n")[0].split(',').map(&.to_i)

fuel_cost = fuel_cost(input)
enhanced_fuel_cost = enhanced_fuel_cost(input)

puts "Fuel Cost: #{fuel_cost}"
puts "Enhanced Fuel Cost: #{enhanced_fuel_cost}"

