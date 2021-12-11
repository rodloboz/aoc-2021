# frozen_string_literal: true

require 'spec_helper'

require_relative '../../day_11/app'

RSpec.describe Day11 do
  describe '#run' do
    it 'returns the correct results' do
      expected = {
        flash_count: 1675,
        synchronized_step: 515
      }
      expect(described_class.run).to eq(expected)
    end
  end
end
