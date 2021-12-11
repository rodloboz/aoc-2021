# frozen_string_literal: true

require 'spec_helper'

require_relative '../../day_11/octopus'
require_relative '../../day_11/pod'

RSpec.describe Octopus do
  subject(:octopus) { described_class.new(x, y, energy) }

  let(:x) { 6 }
  let(:y) { 8 }
  let(:energy) { 0 }

  context 'with invalid energy' do
    let(:energy) { -1 }

    it 'raises an error' do
      expect { described_class.new(x, y, energy) }.to raise_error(Octopus::InvalidOctopus)
    end
  end

  context 'with invalid x coordinate' do
    let(:x) { nil }

    it 'raises an error' do
      expect { described_class.new(x, y, energy) }.to raise_error(Octopus::InvalidOctopus)
    end
  end

  context 'with invalid y coordinate' do
    let(:y) { nil }

    it 'raises an error' do
      expect { described_class.new(x, y, energy) }.to raise_error(Octopus::InvalidOctopus)
    end
  end

  describe '#coordinates' do
    it 'returns the x,y coordinates' do
      expect(octopus.coordinates).to eq([6, 8])
    end
  end

  describe '#increment' do
    context 'with an energy of 9' do
      let(:energy) { 9 }

      it 'sets the energy to zero' do
        expect(octopus.energy).to eq(9)
        octopus.increment
        expect(octopus.energy).to eq(0)
      end

      it 'flashes' do
        expect(octopus.flashed?).to eq(false)
        octopus.increment
        expect(octopus.flashed?).to eq(true)
      end

      it 'touches adjacent octopuses' do
        grid = [
          [1, 1, 1],
          [2, 9, 2],
          [3, 3, 3]
        ]
        expected_grid = [
          [2, 2, 2],
          [3, 0, 3],
          [4, 4, 4]
        ]

        pod = Pod.new(grid)
        octopus = pod.find_by_coordinates(1, 1)
        octopus.increment

        expect(pod.to_grid).to eq(expected_grid)
      end
    end

    context 'with an energy lower than nine' do
      let(:energy) { 0 }

      it 'increases the energy by 1' do
        expect(octopus.energy).to eq(0)
        octopus.increment
        expect(octopus.energy).to eq(1)
      end

      it 'does not flash' do
        expect(octopus.flashed?).to eq(false)
        octopus.increment
        expect(octopus.flashed?).to eq(false)
      end

      it 'does not touch adjacent octopuses' do
        grid = [
          [1, 1, 1],
          [2, 2, 2],
          [3, 3, 3]
        ]
        expected_grid = [
          [2, 1, 1],
          [2, 2, 2],
          [3, 3, 3]
        ]

        pod = Pod.new(grid)
        octopus = pod.find_by_coordinates(0, 0)
        octopus.increment

        expect(pod.to_grid).to eq(expected_grid)
      end
    end
  end

  describe '#reset' do
    let(:energy) { 9 }

    it 'sets flashed to false' do
      octopus.increment
      expect(octopus.flashed?).to eq(true)

      octopus.reset
      expect(octopus.flashed?).to eq(false)
    end
  end
end
