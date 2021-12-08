# frozen_string_literal: true

class Cypher
  # The sum of each column in the matrix can be used to normalize
  # each digit. This normalized key will be constant regardless of
  # the permutation of the matrix.
  #
  #     a b c d e f g
  # 0   1 1 1 0 1 1 1
  # 1   0 0 1 0 0 1 0
  # 2   1 0 1 1 1 0 1
  # 3   1 0 1 1 0 1 1
  # 4   0 1 1 1 0 1 0
  # 5   1 1 0 1 0 1 1
  # 6   1 1 0 1 1 1 1
  # 7   1 0 1 0 0 1 0
  # 8   1 1 1 1 1 1 1
  # 9   1 1 1 1 0 1 1
  # =   8 6 8 7 4 9 7
  KEY = {
    '89' => 1,
    '889' => 7,
    '6789' => 4,
    '47788' => 2,
    '77889' => 3,
    '67789' => 5,
    '467889' => 0,
    '467789' => 6,
    '677889' => 9,
    '4677889' => 8
  }.freeze

  def initialize(input)
    @input = input
  end

  def decrypted_input
    @decrypted_input ||= normalize_segments(input)
  end

  def decrypt(segments)
    if segments.respond_to?(:map)
      normalize_segments(segments)
    else
      normalize_segments([segments]).first
    end
  end

  private

  attr_reader :input

  def normalize_segments(segments)
    segments.map { |segment| KEY[normalize(segment)] }
  end

  def normalize(segment)
    segment.chars.reduce([]) do |acc, char|
      acc << normalization_key[char]
    end.sort.join
  end

  # Return an Hash with the normalization key for the given 10 segments.
  # => {"a"=>8, "c"=>7, "e"=>6, "d"=>8, "g"=>4, "f"=>7, "b"=>9}
  def normalization_key
    @normalization_key ||= input
                           .map(&:chars).flatten
                           .each_with_object(Hash.new(0)) { |c, h| h[c] += 1 }
  end
end
