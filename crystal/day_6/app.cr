require "./lanternfish"

filepath = File.expand_path("../../data/day_6/input.txt")
input = File.read(filepath).split("\n")[0].split(',').map(&.to_i)

count_80 = school_size(input, 80)
count_256 = school_size(input, 256)

puts "Number of lanternfish after 80 days: #{count_80}"
puts "Number of lanternfish after 256 days: #{count_256}"

