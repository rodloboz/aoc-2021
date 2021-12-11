# frozen_string_literal: true

require 'spec_helper'

require_relative '../../day_09/app'

RSpec.describe Day9 do
  describe '#run' do
    it 'returns the correct results' do
      expected = {
        risk_level: 504,
        basin_sizes: 1_558_722
      }
      expect(described_class.run).to eq(expected)
    end
  end
end
