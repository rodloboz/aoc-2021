# frozen_string_literal: true

require 'spec_helper'

require_relative '../../day_8/app'

RSpec.describe Day8 do
  describe '#run' do
    it 'returns the correct results' do
      expected = {
        easy_digits: 449,
        decoded_entries: 968_175
      }
      expect(described_class.run).to eq(expected)
    end
  end
end
