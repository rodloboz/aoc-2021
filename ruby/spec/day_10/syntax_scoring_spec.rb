# frozen_string_literal: true

require 'spec_helper'

require_relative '../../day_10/syntax_scoring'

RSpec.describe 'day_10' do
  let(:lines) do
    [
      '[({(<(())[]>[[{[]{<()<>>',
      '[(()[<>])]({[<{<<[]>>(',
      '{([(<{}[<>[]}>{[]{[(<()>',
      '(((({<>}<{<{<>}{[]{[]{}',
      '[[<[([]))<([[{}[[()]]]',
      '[{[{({}]{}}([{[{{{}}([]',
      '{<[[]]>}<{[{[{[]{()[[[]',
      '[<(<(<(<{}))><([]([]()',
      '<{([([[(<>()){}]>(<<{{',
      '<{([{{}}[<[[[<>{}]]]>[]]'
    ]
  end

  describe '#syntax_error_score' do
    it 'returns the total score of illegal characters in correupt lines' do
      expect(syntax_error_score(lines)).to eq(26_397)
    end
  end

  describe '#syntax_completion_score' do
    it 'returns the total score of illegal characters in correupt lines' do
      expect(syntax_completion_score(lines)).to eq(288_957)
    end
  end
end
