require_relative './lanternfish'

FILEPATH = '../../data/day_6/input.txt'
days = 256

filepath = File.expand_path(FILEPATH, File.dirname(__FILE__))
fish = File.read(filepath).split("\n")[0].split(",").map(&:to_i)

puts respawn(fish, days)
