# frozen_string_literal: true

require 'spec_helper'

require_relative '../../day_04/board_array'

RSpec.describe BoardArray do
  subject(:board_array) { described_class.new([22, 13, 17, 11, 0]) }

  describe '#match' do
    it 'matches drawn numbers' do
      board_array.match(11)

      expect(board_array.unmatched_numbers).to eq([22, 13, 17, 0])
      expect(board_array.completed?).to eq(false)

      board_array.match(22)
      board_array.match(13)
      board_array.match(17)
      board_array.match(0)

      expect(board_array.unmatched_numbers).to eq([])
      expect(board_array.completed?).to eq(true)
    end
  end
end
