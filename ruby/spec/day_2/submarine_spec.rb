# frozen_string_literal: true

require 'spec_helper'

require_relative '../../day_2/submarine'

RSpec.describe 'day_2' do
  describe '#calculate_position_and_depth' do
    it 'returns the horizontal position and depth after a planner course' do
      inputs = [
        ['forward', 5],
        ['down', 5],
        ['forward', 8],
        ['up', 3],
        ['down', 8],
        ['forward', 2]
      ]

      expect(calculate_position_and_depth(inputs)).to eq(horizontal: 15, depth: 10)
    end
  end

  describe '#advanced_calculate_position_and_depth' do
    it 'returns the horizontal position and depth after a planner course' do
      inputs = [
        ['forward', 5],
        ['down', 5],
        ['forward', 8],
        ['up', 3],
        ['down', 8],
        ['forward', 2]
      ]

      expect(advanced_calculate_position_and_depth(inputs)).to eq(horizontal: 15, depth: 60)
    end
  end
end
