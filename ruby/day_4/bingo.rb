require_relative './board'

class Bingo
  attr_reader :first_winning_board, :last_winning_board, :current_draw

  def initialize(boards, draw)
    @boards = boards.map { |board| Board.new(board, board.transpose) }
    @draw = draw
    @first_winning_board = nil
    @last_winning_board = nil
    @first_winning_draw = nil
    @current_draw = nil
  end

  def score
    run_game
    first_winning_board.score * current_draw
  end

  def last_to_win_score
    run_last_to_win_game
    last_winning_board.score * current_draw
  end

  private

  attr_reader :draw, :boards

  def run_game
    draw.each do |number|
      @current_draw = number
      mark_boards(number)
      break if first_winning_board
    end
  end

  def run_last_to_win_game
    draw.each do |number|
      @current_draw = number
      mark_boards(number)
      break if all_board_locked?
    end
  end

  def all_board_locked?
    boards.all?(&:locked?)
  end

  def mark_boards(number)
    boards.each do |board|
      next if board.locked?

      board.mark(number)

      if board.completed?
        @first_winning_board ||= board
        @last_winning_board = board
      end
    end
  end
end
