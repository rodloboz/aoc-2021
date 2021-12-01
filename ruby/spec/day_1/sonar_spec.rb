# frozen_string_literal: true

require 'spec_helper'

require_relative '../../day_1/sonar'

RSpec.describe 'day_1' do
  describe '#measurement_increases' do
    it 'returns the number of times a depth measurement increases' do
      inputs = [
        199,
        200,
        208,
        210,
        200,
        207,
        240,
        269,
        260,
        263
      ]

      expect(measurement_increases(inputs)).to eq(7)
    end
  end

  describe '#sliding_window_increases' do
    it 'returns the number of times the sum of measurements increases' do
      inputs = [
        199,
        200,
        208,
        210,
        200,
        207,
        240,
        269,
        260,
        263
      ]

      expect(sliding_window_increases(inputs)).to eq(5)
    end
  end
end
