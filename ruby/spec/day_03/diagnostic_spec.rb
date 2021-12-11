# frozen_string_literal: true

require 'spec_helper'

require_relative '../../day_03/diagnostic'

RSpec.describe 'day_3' do
  describe '#most_common_bit' do
    it 'returns the most common bit in the list' do
      bits = %w[0 1 1 1 1 0 0 1 1 1 0 0]
      expect(most_common_bit(bits)).to eq('1')
    end

    it 'can the used to determine the least_common_bit' do
      bits = %w[0 1 1 1 1 0 0 1 1 1 0 0]
      least_most_common_bit = most_common_bit(bits) == '1' ? '0' : '1'
      expect(least_most_common_bit).to eq('0')
    end
  end

  describe '#gamma_rate' do
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
      expect(gamma_rate(inputs)).to eq(22)
    end
  end

  describe '#epsilon_rate' do
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
      expect(epsilon_rate(inputs)).to eq(9)
    end
  end

  describe '#power_consumption' do
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
      expect(power_consumption(inputs)).to eq(198)
    end
  end

  describe '#o2_generator_rating' do
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
      expect(o2_generator_rating(inputs)).to eq(23)
    end
  end

  describe '#co2_scrubber_rating' do
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
      expect(co2_scrubber_rating(inputs)).to eq(10)
    end
  end

  describe '#life_support_rating' do
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
      expect(life_support_rating(inputs)).to eq(230)
    end
  end
end
