# frozen_string_literal: true

class Digit
  class InvalidDigitError < StandardError; end
  class InvalidSegmentValues < StandardError; end

  SEGMENTS_TO_DIGIT = {
    0 => %i[top top_left top_right bottom_left bottom_right bottom].sort,
    1 => %i[top_right bottom_right].sort,
    2 => %i[top top_right middle bottom_left bottom].sort,
    3 => %i[top top_right middle bottom_right bottom].sort,
    4 => %i[top_left top_right middle bottom_right].sort,
    5 => %i[top top_left middle bottom_right bottom].sort,
    6 => %i[top top_left middle bottom_left bottom_right bottom].sort,
    7 => %i[top top_right bottom_right].sort,
    8 => %i[top top_left top_right middle bottom_left bottom_right bottom].sort,
    9 => %i[top top_left top_right middle bottom_right bottom].sort
  }.freeze

  attr_reader :segments

  def self.segment_count_for(digit)
    SEGMENTS_TO_DIGIT[digit].size
  end

  def self.with_segment_count(count)
    SEGMENTS_TO_DIGIT.select do |_digit, segments|
      segments.size == count
    end.keys
  end

  def initialize(segments)
    @segments = segments
    validate_segments
  end

  def display
    SEGMENTS_TO_DIGIT.invert.fetch(segments.keys.sort)
  rescue KeyError
    raise InvalidDigitError, 'Segment combination is not supported'
  end

  private

  def validate_segments
    validate_segment_values
    display
  end

  def validate_segment_values
    return if segments.values.uniq.size == segments.values.size

    raise InvalidSegmentValues, 'Each segment must have a unique value'
  end
end
