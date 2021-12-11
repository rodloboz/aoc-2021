# frozen_string_literal: true

require_relative './bingo'

class Day4
  BOARDS_FILEPATH = '../../data/day_04/boards.txt'
  DRAWS_FILEPATH = '../../data/day_04/draw.txt'

  def self.run
    new.run
  end

  def initialize
    load_input
  end

  def run
    {
      winning_score: bingo.score,
      last_winning_score: bingo.last_winning_score
    }
  end

  private

  attr_reader :draws, :boards

  def bingo
    @bingo ||= Bingo.new(boards, draws)
  end

  def load_input
    load_draws
    load_boards
  end

  def load_draws
    filepath = File.expand_path(DRAWS_FILEPATH, File.dirname(__FILE__))

    @draws = File.read(filepath).split(',').map(&:to_i)
  end

  def load_boards
    filepath = File.expand_path(BOARDS_FILEPATH, File.dirname(__FILE__))
    @boards = []
    board = []
    row_count = 0
    File.readlines(filepath).each do |line|
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
  end
end

result = Day4.run

puts "Winning Board Score: #{result[:winning_score]}"
puts "Last Winning Board Score: #{result[:last_winning_score]}"
