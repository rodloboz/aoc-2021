require "./diagnostic"

filepath = File.expand_path("../../data/day_3/input.txt")
input = File.read_lines(filepath)

power_consumption = power_consumption(input)
life_support_rating = life_support_rating(input)

puts "Power Consumption: #{power_consumption}"
puts "Life Support Rating: #{life_support_rating}"

