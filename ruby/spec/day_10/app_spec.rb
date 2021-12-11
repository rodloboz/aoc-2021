# frozen_string_literal: true

require 'spec_helper'

require_relative '../../day_10/app'

RSpec.describe Day10 do
  describe '#run' do
    it 'returns the correct results' do
      expected = {
        syntax_error_score: 243_939,
        syntax_completion_score: 2_421_222_841
      }
      expect(described_class.run).to eq(expected)
    end
  end
end
