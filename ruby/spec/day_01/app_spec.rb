# frozen_string_literal: true

require 'spec_helper'

require_relative '../../day_01/app'

RSpec.describe Day1 do
  describe '#run' do
    it 'returns the correct results' do
      expected = {
        measurement_increases: 1564,
        sliding_window_increases: 1611
      }
      expect(described_class.run).to eq(expected)
    end
  end
end
