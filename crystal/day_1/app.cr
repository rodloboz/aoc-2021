require "./sonar"

filepath = File.expand_path("../../data/day_1/input.txt")
inputs = File.read_lines(filepath).map &.to_i

result = measurement_increases(inputs)
window = sliding_window_increases(inputs)

puts "Increases: #{result} | Window Increases: #{window}"

