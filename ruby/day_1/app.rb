# frozen_string_literal: true

require_relative './sonar'

file = File.expand_path('../../data/day_1/input.txt', File.dirname(__FILE__))
inputs = File.read(file).split.map(&:to_i)

result = measurement_increases(inputs)
window = sliding_window_increases(inputs)

puts "Increases: #{result} | Window Increases: #{window}"
