# frozen_string_literal: true

require 'spec_helper'

require_relative '../../day_9/point'
require_relative '../../day_9/grid'

RSpec.describe Point do
  subject(:point) { described_class.new(x, y, height) }

  let(:x) { 6 }
  let(:y) { 8 }
  let(:height) { 3 }

  context 'with invalid height' do
    let(:height) { -1 }

    it 'raises an error' do
      expect { described_class.new(x, y, height) }.to raise_error(Point::InvalidPoint)
    end
  end

  context 'with invalid x coordinate' do
    let(:x) { nil }

    it 'raises an error' do
      expect { described_class.new(x, y, height) }.to raise_error(Point::InvalidPoint)
    end
  end

  context 'with invalid y coordinate' do
    let(:y) { nil }

    it 'raises an error' do
      expect { described_class.new(x, y, height) }.to raise_error(Point::InvalidPoint)
    end
  end

  describe 'comparable' do
    context 'when two points have the same x,y coordinates' do
      it 'points are equal' do
        other = described_class.new(x, y, height + 1)
        expect(point == other).to eq(true)
      end

      it 'points are unique in a Set' do
        points = Set.new
        other = described_class.new(x, y, height + 1)
        points << point
        points << other

        expect(points.size).to eq(1)
      end
    end

    context 'when two points do not have the same x,y coordinates' do
      it 'points are not equal' do
        other = described_class.new(x, y + 1, height)
        expect(point == other).to eq(false)
      end

      it 'points are added to the Set' do
        points = Set.new
        other = described_class.new(x, y + 1, height)
        points << point
        points << other

        expect(points.size).to eq(2)
      end
    end
  end

  describe '#coordinates' do
    it 'returns de x,y coordinates' do
      expect(point.coordinates).to eq([6, 8])
    end
  end

  describe '#low_point?' do
    subject(:point) { described_class.new(x, y, height) }

    let(:grid) { Grid.new(heightmap) }
    let(:heightmap) do
      [
        [2, 1, 9, 9, 9, 4, 3, 2, 1, 0],
        [3, 9, 8, 7, 8, 9, 4, 9, 2, 1],
        [9, 8, 5, 6, 7, 8, 9, 8, 9, 2],
        [8, 7, 6, 7, 8, 9, 6, 7, 8, 9],
        [9, 8, 9, 9, 9, 6, 5, 6, 7, 8]
      ]
    end

    before { point.grid = grid }

    context 'when there are no lower adjacent heights' do
      let(:x) { 6 }
      let(:y) { 4 }
      let(:height) { 5 }

      it 'returns true' do
        expect(point.low_point?).to eq(true)
      end
    end

    context 'when there are lower adjacent heights' do
      let(:x) { 3 }
      let(:y) { 2 }
      let(:height) { 6 }

      it 'returns false' do
        expect(point.low_point?).to eq(false)
      end
    end
  end
end
