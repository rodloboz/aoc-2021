# frozen_string_literal: true

require_relative './diagnostic'

file = File.expand_path('../../data/day_3/input.txt', File.dirname(__FILE__))
inputs = File.read(file).split

puts "Power Consumption: #{power_consumption(inputs)} | Life Support Rating: #{life_support_rating(inputs)}"
