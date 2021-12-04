# frozen_string_literal: true

require 'spec_helper'

require_relative '../../day_4/app'

RSpec.describe Day4 do
  describe '#run' do
    it 'returns the correct results' do
      expected = {
        winning_score: 41_668,
        last_winning_score: 10_478
      }
      expect(described_class.run).to eq(expected)
    end
  end
end
