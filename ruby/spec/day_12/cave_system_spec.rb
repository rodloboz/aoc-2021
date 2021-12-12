# frozen_string_literal: true

require 'spec_helper'

require_relative '../../day_12/cave_system'

RSpec.describe CaveSystem do
  subject(:cave_system) { described_class.new(input) }

  let(:input) do
    %w[
      start-A
      start-b
      A-c
      A-b
      b-d
      A-end
      b-end
    ]
  end

  it 'plots a map of the cave system' do
    expected = {
      'start' => %w[A b],
      'A' => %w[c b end],
      'b' => %w[A d end],
      'c' => %w[A],
      'd' => %w[b]
    }

    expect(cave_system.map).to eq(expected)
  end

  describe '#simple_paths' do
    it 'returns a list of available paths' do
      expected = [
        %w[start A b A c A end],
        %w[start A b A end],
        %w[start A b end],
        %w[start A c A b A end],
        %w[start A c A b end],
        %w[start A c A end],
        %w[start A end],
        %w[start b A c A end],
        %w[start b A end],
        %w[start b end]
      ]

      expect(cave_system.simple_paths).to match_array(expected)
    end
  end
end
