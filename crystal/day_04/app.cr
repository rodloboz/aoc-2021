# frozen_string_literal: true

require "./bingo"

class Day4
  BOARDS_FILEPATH = "../../data/day_04/boards.txt"
  DRAWS_FILEPATH = "../../data/day_04/draw.txt"

  def self.run
    new.run
  end

  def initialize
    @draws = [] of Int32
    load_input
  end

  def run
    {
      winning_score: bingo.score,
      last_winning_score: bingo.last_winning_score
    }
  end

  private getter :draws, :boards

  private def bingo
    @bingo ||= Bingo.new(boards, draws)
  end

  private def load_input
    load_draws
    load_boards
  end

  private def load_draws
    filepath = File.expand_path(DRAWS_FILEPATH, File.dirname(__FILE__))

    @draws = File.read(filepath).split(",").map &.to_i
  end

  private def load_boards
    filepath = File.expand_path(BOARDS_FILEPATH, File.dirname(__FILE__))
    @boards = [] of Array(Array(Int32))
    board = [] of Array(Int32)
    row_count = 0
    File.read_lines(filepath).each do |line|
      if row_count == 5
        row_count = 0
        boards.try &.push(board)
        board = [] of Array(Int32)
      end

      row = line.split.map &.to_i
      next if row.empty?

      board << row
      row_count += 1
    end
  end
end

result = Day4.run

puts "Winning Board Score: #{result[:winning_score]}"
puts "Last Winning Board Score: #{result[:last_winning_score]}"
