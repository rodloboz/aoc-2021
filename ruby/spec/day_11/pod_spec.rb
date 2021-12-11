# frozen_string_literal: true

require 'spec_helper'

require_relative '../../day_11/pod'

RSpec.describe Pod do
  subject(:pod) { described_class.new(grid) }

  let(:grid) do
    [
      [1, 1, 1, 1, 1],
      [1, 9, 9, 9, 1],
      [1, 9, 1, 9, 1],
      [1, 9, 9, 9, 1],
      [1, 1, 1, 1, 1]
    ]
  end

  it 'maps the grid' do
    expect(pod.size).to eq(grid.flatten.size)
    expect(pod.octopuses[[2, 2].to_s].energy).to eq(1)
  end

  describe '#find_by_coordinates' do
    it 'returns the octopus that matches the coordinates' do
      octopus = pod.find_by_coordinates(1, 2)
      expect(octopus.energy).to eq(9)
    end

    it 'returns nil if no octopus is found' do
      octopus = pod.find_by_coordinates(-1, 2)
      expect(octopus).to be_nil
    end
  end

  describe '#step' do
    context 'with default argument' do
      let(:expected_grid) do
        [
          [3, 4, 5, 4, 3],
          [4, 0, 0, 0, 4],
          [5, 0, 0, 0, 5],
          [4, 0, 0, 0, 4],
          [3, 4, 5, 4, 3]
        ]
      end

      it 'increments and flashes octopuses' do
        expect(pod.to_grid).to eq(grid)

        pod.step

        expect(pod.to_grid).to eq(expected_grid)
      end
    end

    context 'with number of steps given' do
      let(:expected_grid) do
        [
          [4, 5, 6, 5, 4],
          [5, 1, 1, 1, 5],
          [6, 1, 1, 1, 6],
          [5, 1, 1, 1, 5],
          [4, 5, 6, 5, 4]
        ]
      end

      it 'increments and flashes octopuses' do
        expect(pod.to_grid).to eq(grid)

        pod.step(2)

        expect(pod.to_grid).to eq(expected_grid)
      end
    end
  end
end
