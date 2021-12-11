# frozen_string_literal: true

require_relative './scanner'

ERROR_SCORES = {
  ')' => 3,
  ']' => 57,
  '}' => 1197,
  '>' => 25_137
}.freeze

UNMATCHED_SCORES = {
  '(' => 1,
  '[' => 2,
  '{' => 3,
  '<' => 4
}.freeze

def syntax_error_score(lines)
  lines.reduce(0) do |acc, line|
    Scanner.new(line).scan
    acc
  rescue Scanner::InvalidCharacterError => e
    acc + ERROR_SCORES[e.character]
  end
end

def syntax_completion_score(lines)
  scores = []
  lines.each do |line|
    line_score = 0
    scanner = Scanner.new(line)
    scanner.scan
    scanner.unmatched.reverse.each do |c|
      line_score = (line_score * 5) + UNMATCHED_SCORES[c]
    end
    scores << line_score
  rescue Scanner::InvalidCharacterError
    # no_op
  end
  half = (scores.size / 2.to_f).floor
  scores.sort[half]
end
