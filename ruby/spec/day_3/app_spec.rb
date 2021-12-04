# frozen_string_literal: true

require 'spec_helper'

require_relative '../../day_3/app'

RSpec.describe Day3 do
  describe '#run' do
    it 'returns the correct results' do
      expected = {
        power_consumption: 1_025_636,
        life_support_rating: 793_873
      }
      expect(described_class.run).to eq(expected)
    end
  end
end
