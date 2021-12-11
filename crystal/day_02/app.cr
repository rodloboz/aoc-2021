# frozen_string_literal: true

require "./submarine"

filepath = File.expand_path("../../data/day_02/input.txt")
inputs = File.read_lines(filepath).map do |line|
  command, value = line.split
  {command, value.to_i}
end

coordinates = calculate_position_and_depth(inputs)
position = coordinates["horizontal"] * coordinates["depth"]

puts "Horizontal Position: #{coordinates["horizontal"]} | Depth: #{coordinates["depth"]} | Result: #{position}"

puts "====== CALCULATING USING ADVANCED OPERATION =========="

coordinates = advanced_calculate_position_and_depth(inputs)
position = coordinates["horizontal"] * coordinates["depth"]

puts "Horizontal Position: #{coordinates["horizontal"]} | Depth: #{coordinates["depth"]} | Result: #{position}"
