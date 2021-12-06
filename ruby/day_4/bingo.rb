# frozen_string_literal: true

require_relative './board'

class Bingo
  attr_reader :completed_boards, :current_draw

  def initialize(boards, draws)
    @boards = boards.map { |board| Board.new(board, board.transpose) }
    @draws = draws
    @completed_boards = []
    @winning_draws = []
    @current_draw = nil
    run_game
  end

  def score
    completed_boards.first.score * winning_draws.first
  end

  def last_winning_score
    completed_boards.last.score * winning_draws.last
  end

  private

  attr_reader :draws, :boards, :winning_draws

  def run_game
    draws.each do |number|
      @current_draw = number
      match_boards(number)
      break if all_boards_locked?
    end
  end

  def all_boards_locked?
    boards.all?(&:locked?)
  end

  def match_boards(number)
    boards.each do |board|
      next if board.locked?

      board.match(number)

      if board.locked?
        completed_boards << board
        winning_draws << number
      end
    end
  end
end
