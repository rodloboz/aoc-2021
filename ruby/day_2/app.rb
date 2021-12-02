# frozen_string_literal: true

require_relative './submarine'

file = File.expand_path('../../data/day_2/input.txt', File.dirname(__FILE__))
inputs = []
File.readlines(file).each do |line|
  command, value = line.split
  inputs << [command, value.to_i]
end

coordinates = calculate_position_and_depth(inputs)
position = coordinates[:horizontal] * coordinates[:depth]

puts "Horizontal Position: #{coordinates[:horizontal]} | Depth: #{coordinates[:depth]} | Result: #{position}"

puts '====== CALCULATING USING ADVANCED OPERATION =========='

coordinates = advanced_calculate_position_and_depth(inputs)
position = coordinates[:horizontal] * coordinates[:depth]

puts "Horizontal Position: #{coordinates[:horizontal]} | Depth: #{coordinates[:depth]} | Result: #{position}"
