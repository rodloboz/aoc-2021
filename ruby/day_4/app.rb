# frozen_string_literal: true

require_relative './bingo'

file = File.expand_path('../../data/day_4/draw.txt', File.dirname(__FILE__))
draw = File.read(file).split(',').map(&:to_i)

# require 'byebug'; byebug

file = File.expand_path('../../data/day_4/boards.txt', File.dirname(__FILE__))
boards = []
board = []
row_count = 0
File.readlines(file).each do |line|
  if row_count == 5
    row_count = 0
    boards << board
    board = []
  end

  row = line.split.map(&:to_i)
  next if row.empty?

  board << row
  row_count += 1
end

bingo = Bingo.new(boards, draw)

puts "Score: #{bingo.score} | Last to Win Score: #{bingo.last_winning_score}"
