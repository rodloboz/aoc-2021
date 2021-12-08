# frozen_string_literal: true

require 'spec_helper'

require_relative '../../day_8/digit'

RSpec.describe Digit do
  it 'raises an error when segment values are not unique' do
    segments = { top_right: 'd', top: 'a', bottom_right: 'a' }
    expect { described_class.new(segments) }.to raise_error(Digit::InvalidSegmentValues)
  end

  describe '.number_of_segment_for' do
    it 'returns the number of segments for the given digit' do
      expect(described_class.segment_count_for(0)).to eq(6)
      expect(described_class.segment_count_for(1)).to eq(2)
      expect(described_class.segment_count_for(2)).to eq(5)
      expect(described_class.segment_count_for(3)).to eq(5)
      expect(described_class.segment_count_for(4)).to eq(4)
      expect(described_class.segment_count_for(5)).to eq(5)
      expect(described_class.segment_count_for(6)).to eq(6)
      expect(described_class.segment_count_for(7)).to eq(3)
      expect(described_class.segment_count_for(8)).to eq(7)
      expect(described_class.segment_count_for(9)).to eq(6)
    end
  end

  describe '.with_segment_count' do
    it 'returns the digits that match the given number of segments' do
      expect(described_class.with_segment_count(1)).to eq([])
      expect(described_class.with_segment_count(2)).to eq([1])
      expect(described_class.with_segment_count(3)).to eq([7])
      expect(described_class.with_segment_count(4)).to eq([4])
      expect(described_class.with_segment_count(5)).to eq([2, 3, 5])
      expect(described_class.with_segment_count(6)).to eq([0, 6, 9])
      expect(described_class.with_segment_count(7)).to eq([8])
    end
  end

  describe '#display' do
    it 'can display a 0' do
      segments = { top_right: 'd', top_left: 'e', top: 'a', bottom_right: 'c', bottom_left: 'b', bottom: 'f' }
      digit = described_class.new(segments)
      expect(digit.display).to eq(0)
    end

    it 'can display a 1' do
      segments = { top_right: 'd', bottom_right: 'c' }
      digit = described_class.new(segments)
      expect(digit.display).to eq(1)
    end

    it 'can display a 2' do
      segments = { top_right: 'd', top: 'a', middle: 'c', bottom_left: 'b', bottom: 'f' }
      digit = described_class.new(segments)
      expect(digit.display).to eq(2)
    end

    it 'can display a 3' do
      segments = { top_right: 'd', middle: 'e', top: 'a', bottom_right: 'c', bottom: 'f' }
      digit = described_class.new(segments)
      expect(digit.display).to eq(3)
    end

    it 'can display a 4' do
      segments = { top_right: 'd', top_left: 'e', middle: 'a', bottom_right: 'c' }
      digit = described_class.new(segments)
      expect(digit.display).to eq(4)
    end

    it 'can display a 5' do
      segments = { middle: 'd', top_left: 'e', top: 'a', bottom_right: 'c', bottom: 'f' }
      digit = described_class.new(segments)
      expect(digit.display).to eq(5)
    end

    it 'can display a 6' do
      segments = { top_left: 'e', top: 'a', bottom_right: 'c', bottom_left: 'b', bottom: 'f', middle: 'g' }
      digit = described_class.new(segments)
      expect(digit.display).to eq(6)
    end

    it 'can display a 7' do
      segments = { top_right: 'd', top: 'a', bottom_right: 'c' }
      digit = described_class.new(segments)
      expect(digit.display).to eq(7)
    end

    it 'can display a 8' do
      segments = { top_right: 'd', top_left: 'e', top: 'a', bottom_right: 'c', bottom_left: 'b', bottom: 'f',
                   middle: 'g' }
      digit = described_class.new(segments)
      expect(digit.display).to eq(8)
    end

    it 'can display a 9' do
      segments = { top_right: 'd', top_left: 'e', top: 'a', bottom_right: 'c', bottom: 'f', middle: 'g' }
      digit = described_class.new(segments)
      expect(digit.display).to eq(9)
    end

    it 'raises an error when the segment combination is not valid' do
      segments = { top: 'd', bottom: 'a' }
      expect { described_class.new(segments) }.to raise_error(Digit::InvalidDigitError)
    end
  end
end
