# frozen_string_literal: true

require 'spec_helper'

require_relative '../../day_4/board'

RSpec.describe 'Board' do
  subject(:board) { Board.new(rows, columns) }

  let(:rows) do
    [
      [14, 21, 17, 24, 4],
      [10, 16, 15, 9, 19],
      [18, 8, 23, 26, 20],
      [22, 11, 13, 6, 5],
      [2, 0, 12, 3, 7]
    ]
  end
  let(:columns) { rows.transpose }

  describe '#mark' do
    it 'marks drawns numbers' do
      board.mark(7)
      board.mark(4)
      board.mark(9)
      board.mark(5)
      board.mark(11)

      expect(board.completed?).to eq(false)

      board.mark(17)
      board.mark(23)
      board.mark(2)
      board.mark(0)
      board.mark(14)
      board.mark(21)

      expect(board.completed?).to eq(false)

      board.mark(24)

      expect(board.completed?).to eq(true)
      expect(board.score).to eq(188)
    end
  end
end
