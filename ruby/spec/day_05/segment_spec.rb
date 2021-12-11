# frozen_string_literal: true

require 'spec_helper'

require_relative '../../day_05/segment'

RSpec.describe Segment do
  let(:segment) { described_class.new([[2, 3], [4, 5]]) }

  it 'has a starting point' do
    expect(segment.starting_point).to eq([2, 3])
  end

  it 'has an ending point' do
    expect(segment.ending_point).to eq([4, 5])
  end

  describe '#all_points' do
    it 'returns all the points in the segment' do
      expect(segment.all_points).to eq([[2, 3], [3, 4], [4, 5]])
    end
  end

  describe '#point_at?' do
    it 'returns true if the segment intersects the given coordinates' do
      expect(segment.point_at?([3, 4])).to eq(true)
    end

    it 'returns false if the segment does not intersect the given coordinates' do
      expect(segment.point_at?([3, 3])).to eq(false)
    end
  end
end
