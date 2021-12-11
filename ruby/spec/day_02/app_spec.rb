# frozen_string_literal: true

require 'spec_helper'

require_relative '../../day_02/app'

RSpec.describe Day2 do
  describe '#run' do
    it 'returns the correct results' do
      expected = {
        simple: {
          horizontal: 1890,
          depth: 1172,
          position: 2_215_080
        },
        advanced: {
          horizontal: 1890,
          depth: 986_622,
          position: 1_864_715_580
        }
      }
      expect(described_class.run).to eq(expected)
    end
  end
end
