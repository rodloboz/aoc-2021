# frozen_string_literal: true

require 'spec_helper'

require_relative '../../day_8/cypher'

RSpec.describe Cypher do
  subject(:cypher) { described_class.new(input) }

  let(:input) { %w[acedgfb cdfbe gcdfa fbcad dab cefabd cdfgeb eafb cagedb ab] }

  describe '#decrypted_input' do
    it 'returns de decoded output' do
      expected = [8, 5, 2, 3, 7, 9, 6, 4, 0, 1]
      expect(cypher.decrypted_input).to eq(expected)
    end
  end

  describe '#decrypt' do
    it 'decrypts segments based on the key derived from the original input' do
      segments = %w[cdfeb fcadb cdfeb cdbaf]
      expect(cypher.decrypt(segments)).to eq([5, 3, 5, 3])
      expect(cypher.decrypt(segments[0])).to eq(5)
    end
  end
end
