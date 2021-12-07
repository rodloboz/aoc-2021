# frozen_string_literal: true

require 'spec_helper'

require_relative '../../day_7/app'

RSpec.describe Day7 do
  describe '#run' do
    it 'returns the correct results' do
      expected = {
        fuel_cost: 347_509,
        enhanced_fuel_cost: 98_257_206
      }
      expect(described_class.run).to eq(expected)
    end
  end
end
