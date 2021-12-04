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

puts "Score: #{bingo.score} | Last to Win Score: #{bingo.last_to_win_score}"

# 68 73 98 51 49
# 82 56 87 64  8
# 46  7 21 38 30
# 66  5 86 97 74
# 60 63 76 55 39

# 92 20 87 77 52
# 72 29 81 24 64
# 26 16 19 79 68
#  8 53 90 14 74
# 28 89 78 54 15

