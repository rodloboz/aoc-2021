# frozen_string_literal: true

require 'spec_helper'

require_relative '../../day_04/board'

RSpec.describe Board do
  subject(:board) { described_class.new(rows, columns) }

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

  describe '#match' do
    it 'matches drawn numbers' do
      board.match(7)
      board.match(4)
      board.match(9)
      board.match(5)
      board.match(11)

      expect(board.locked?).to eq(false)

      board.match(17)
      board.match(23)
      board.match(2)
      board.match(0)
      board.match(14)
      board.match(21)

      expect(board.locked?).to eq(false)

      board.match(24)

      expect(board.locked?).to eq(true)
      expect(board.score).to eq(188)
    end
  end
end
