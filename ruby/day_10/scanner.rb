# frozen_string_literal: true

class Scanner
  class InvalidCharacterError < StandardError
    attr_reader :character

    def initialize(message, character)
      super(message)
      @character = character
    end
  end

  OPENING_LEX = ['(', '[', '{', '<'].freeze
  CLOSING_LEX = [')', ']', '}', '>'].freeze
  MATCHING = {
    '(' => ')',
    '[' => ']',
    '{' => '}',
    '<' => '>'
  }.freeze

  attr_reader :unmatched

  def initialize(source)
    @source = source
    @next_p = 0
    @unmatched = []
  end

  def scan
    while source_uncompleted?
      c = consume
      expected = MATCHING.fetch(unmatched.last, nil)

      if OPENING_LEX.include?(c)
        unmatched << c
      elsif CLOSING_LEX.include?(c) && c != expected
        message = "Expected #{expected}, but found #{c} instead."
        raise InvalidCharacterError.new(message, c)
      elsif CLOSING_LEX.include?(c) && c == expected
        unmatched.pop
      end
    end
  end

  private

  attr_reader :source, :next_p

  def consume(offset = 1)
    t = lookahead(offset)
    @next_p += offset
    t
  end

  def lookahead(offset = 1)
    lookahead_p = (next_p - 1) + offset
    return nil if lookahead_p.negative? || lookahead_p >= source.length

    source[lookahead_p]
  end

  def source_uncompleted?
    next_p < source.length
  end
end
