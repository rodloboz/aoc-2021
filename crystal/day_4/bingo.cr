# frozen_string_literal: true

require "./board"

class Bingo
  @current_draw : Int32 | Nil
  @boards : Array(Board)
  @draws : Array(Int32)

  getter :completed_boards, :current_draw

  def initialize(boards, draws)
    @boards = boards.not_nil!.map { |board| Board.new(board, board.transpose) }
    @draws = draws
    @completed_boards = [] of Board
    @winning_draws = [] of Int32
    @current_draw = nil
    run_game
  end

  def score
    completed_boards.first.score * winning_draws.first
  end

  def last_winning_score
    completed_boards.last.score * winning_draws.last
  end

  private getter :draws, :boards, :winning_draws

  private def run_game
    draws.each do |number|
      @current_draw = number
      match_boards(number)
      break if all_boards_locked?
    end
  end

  private def all_boards_locked?
    boards.all? &.locked?
  end

  private def match_boards(number)
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
