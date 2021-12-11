# frozen_string_literal: true

require 'spec_helper'

require_relative '../../day_09/grid'

RSpec.describe Grid do
  subject(:grid) { described_class.new(heightmap) }

  let(:heightmap) do
    [
      [2, 1, 9, 9, 9, 4, 3, 2, 1, 0],
      [3, 9, 8, 7, 8, 9, 4, 9, 2, 1],
      [9, 8, 5, 6, 7, 8, 9, 8, 9, 2],
      [8, 7, 6, 7, 8, 9, 6, 7, 8, 9],
      [9, 8, 9, 9, 9, 6, 5, 6, 7, 8]
    ]
  end

  it 'plots the points' do
    expect(grid.points.size).to eq(heightmap.flatten.size)
    expect(grid.points[[0, 0].to_s].height).to eq(2)
  end

  describe '#find_by_coordinates' do
    it 'returns the point that matches the coordinates' do
      point = grid.find_by_coordinates(1, 2)
      expect(point.height).to eq(8)
    end

    it 'returns nil if no point is found' do
      point = grid.find_by_coordinates(-1, 2)
      expect(point).to be_nil
    end
  end

  describe '#low_points' do
    it 'returns the low points in the grid' do
      heights = grid.low_points.map(&:height)
      expect(heights).to eq([1, 0, 5, 5])
    end
  end

  describe '#risk_level' do
    it 'returns the sum of the risk level of all low points on the heightmap' do
      expect(grid.risk_level).to eq(15)
    end
  end

  describe '#largest_basins_sizes' do
    it 'returns the largest sizes of the largest 3 basins' do
      expect(grid.largest_basins_sizes).to contain_exactly(9, 14, 9)
    end
  end
end
