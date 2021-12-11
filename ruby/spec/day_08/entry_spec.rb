# frozen_string_literal: true

require 'spec_helper'

require_relative '../../day_08/entry'

RSpec.describe Entry do
  subject(:entry) { described_class.new(segments) }

  let(:segments) { 'acedgfb cdfbe gcdfa fbcad dab cefabd cdfgeb eafb cagedb ab | cdfeb fcadb cdfeb cdbaf' }

  describe '#decoded_output' do
    it 'returns de decoded output' do
      expect(entry.decoded_output).to eq('5353')
    end
  end
end
