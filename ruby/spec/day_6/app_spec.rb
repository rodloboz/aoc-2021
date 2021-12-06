# frozen_string_literal: true

require 'spec_helper'

require_relative '../../day_6/app'

RSpec.describe Day6 do
  describe '#run' do
    it 'returns the correct results' do
      expected = {
        count_after80: 353_079,
        count_after256: 1_605_400_130_036
      }
      expect(described_class.run).to eq(expected)
    end
  end
end
