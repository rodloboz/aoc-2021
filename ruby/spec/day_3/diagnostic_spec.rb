# frozen_string_literal: true

require 'spec_helper'

require_relative '../../day_3/diagnostic'

RSpec.describe 'day_3' do
  describe '#find_most_common_bit' do
    it 'returns the most common bit in the list' do
      bits = %w[0 1 1 1 1 0 0 1 1 1 0 0]
      expect(find_most_common_bit(bits)).to eq('1')
    end
  end

  describe '#find_least_common_bit' do
    it 'returns the most common bit in the list' do
      bits = %w[0 1 1 1 1 0 0 1 1 1 0 0]
      expect(find_least_common_bit(bits)).to eq('0')
    end
  end

  describe '#calculate_gamma_rate' do
    it 'returns the gamma rate of the submarine' do
      inputs = %w[
        00100
        11110
        10110
        10111
        10101
        01111
        00111
        11100
        10000
        11001
        00010
        01010
      ]
      expect(calculate_gamma_rate(inputs)).to eq(22)
    end
  end

  describe '#calculate_epsilon_rate' do
    it 'returns the epsilon rate of the submarine' do
      inputs = %w[
        00100
        11110
        10110
        10111
        10101
        01111
        00111
        11100
        10000
        11001
        00010
        01010
      ]
      expect(calculate_epsilon_rate(inputs)).to eq(9)
    end
  end

  describe '#calculate_power_consumption' do
    it 'returns the power consumption of the submarine' do
      inputs = %w[
        00100
        11110
        10110
        10111
        10101
        01111
        00111
        11100
        10000
        11001
        00010
        01010
      ]
      expect(calculate_power_consumption(inputs)).to eq(198)
    end
  end

  describe '#calculate_oxygen_generator_rating' do
    it 'returns the oxygen generator rating of the submarine' do
      inputs = %w[
        00100
        11110
        10110
        10111
        10101
        01111
        00111
        11100
        10000
        11001
        00010
        01010
      ]
      expect(calculate_oxygen_generator_rating(inputs)).to eq(23)
    end
  end

  describe '#calculate_co2_scrubber_rating' do
    it 'returns the CO2 scrubber rating of the submarine' do
      inputs = %w[
        00100
        11110
        10110
        10111
        10101
        01111
        00111
        11100
        10000
        11001
        00010
        01010
      ]
      expect(calculate_co2_scrubber_rating(inputs)).to eq(10)
    end
  end

  describe '#calculate_life_support_rating' do
    it 'returns the life support rating of the submarine' do
      inputs = %w[
        00100
        11110
        10110
        10111
        10101
        01111
        00111
        11100
        10000
        11001
        00010
        01010
      ]
      expect(calculate_life_support_rating(inputs)).to eq(230)
    end
  end
end
