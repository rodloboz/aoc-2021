# frozen_string_literal: true

require_relative './digit'

class Entry
  attr_reader :signals, :outputs

  def initialize(string)
    @signals, @outputs = string.split(' | ').map(&:split)
  end

  def decoded_output
    outputs.map do |output|
      chars = output.chars
      digit_segments = chars.map { |c| segment_map[c] }.zip(chars).to_h
      Digit.new(digit_segments).display
    end.join
  end

  private

  def segments
    @segments ||= [signals, outputs].flatten
  end

  def segment_map
    @segment_map ||= begin
      one = segments.find { |s| s.size == Digit.segment_count_for(1) }.chars
      four = segments.find { |s| s.size == Digit.segment_count_for(4) }.chars
      seven = segments.find { |s| s.size == Digit.segment_count_for(7) }.chars
      eight = segments.find { |s| s.size == Digit.segment_count_for(8) }.chars
      zero_six_nine = segments.select { |s| s.size == Digit.segment_count_for(6) }.map(&:chars)
      two_three_five = segments.select { |s| s.size == Digit.segment_count_for(2) }.map(&:chars)

      top = seven - one
      top_left_and_middle = four - seven

      middle_and_bottom = (two_three_five[0] & two_three_five[1] & two_three_five[2]) - top

      middle = (top_left_and_middle & middle_and_bottom)
      top_left = (top_left_and_middle - middle)
      bottom = (middle_and_bottom - middle)

      six = zero_six_nine.find { |s| (s - seven).length == 4 }
      bottoms = six - (top + middle + bottom + top_left)

      bottom_right = bottoms & one
      bottom_left =  bottoms - one

      top_right = eight - (top + middle + bottom + top_left + bottom_right + bottom_left)

      {
        top: top.first,
        top_left: top_left.first,
        top_right: top_right.first,
        middle: middle.first,
        bottom_left: bottom_left.first,
        bottom_right: bottom_right.first,
        bottom: bottom.first
      }.invert
    end
  end
end
