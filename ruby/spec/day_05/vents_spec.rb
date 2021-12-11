# frozen_string_literal: true

require 'spec_helper'

require_relative '../../day_05/vents'

RSpec.describe 'day_5' do
  describe '#count_overlaps' do
    it 'returns the number of points where at least two segments overlap' do
      input = [
        [[0, 9], [5, 9]],
        [[8, 0], [0, 8]],
        [[9, 4], [3, 4]],
        [[2, 2], [2, 1]],
        [[7, 0], [7, 4]],
        [[6, 4], [2, 0]],
        [[0, 9], [2, 9]],
        [[3, 4], [1, 4]],
        [[0, 0], [8, 8]],
        [[5, 5], [8, 2]]
      ]
      expect(count_overlaps(input)).to eq(5)
    end
  end

  describe '#count_all_overlaps' do
    it 'returns the number of points where at least two segments overlap' do
      input = [
        [[0, 9], [5, 9]],
        [[8, 0], [0, 8]],
        [[9, 4], [3, 4]],
        [[2, 2], [2, 1]],
        [[7, 0], [7, 4]],
        [[6, 4], [2, 0]],
        [[0, 9], [2, 9]],
        [[3, 4], [1, 4]],
        [[0, 0], [8, 8]],
        [[5, 5], [8, 2]]
      ]
      expect(count_all_overlaps(input)).to eq(12)
    end
  end

  describe '#select_horz_vert' do
    it 'returns only horizontal and vertical segments' do
      input = [
        [[0, 9], [5, 9]],
        [[8, 0], [0, 8]],
        [[9, 4], [3, 4]],
        [[2, 2], [2, 1]],
        [[7, 0], [7, 4]],
        [[6, 4], [2, 0]],
        [[0, 9], [2, 9]],
        [[3, 4], [1, 4]],
        [[0, 0], [8, 8]],
        [[5, 5], [8, 2]]
      ]
      expected = [
        [[0, 9], [5, 9]],
        [[9, 4], [3, 4]],
        [[2, 2], [2, 1]],
        [[7, 0], [7, 4]],
        [[0, 9], [2, 9]],
        [[3, 4], [1, 4]]
      ]
      expect(select_horz_vert(input)).to eq(expected)
    end
  end

  describe '#overlap?' do
    it 'returns true when two segments overlap' do
      s1 = [[0, 9], [5, 9]]
      s2 = [[0, 9], [2, 9]]
      expect(overlap?(s1, s2)).to eq(true)

      s1 = [[9, 4], [3, 4]]
      s2 = [[3, 4], [1, 4]]
      expect(overlap?(s1, s2)).to eq(true)

      s1 = [[7, 0], [7, 4]]
      s2 = [[9, 4], [3, 4]]
      expect(overlap?(s1, s2)).to eq(true)
    end

    it 'returns false when two segments do not overlap' do
      s1 = [[9, 4], [3, 4]]
      s2 = [[2, 2], [2, 1]]
      expect(overlap?(s1, s2)).to eq(false)
    end
  end
end
