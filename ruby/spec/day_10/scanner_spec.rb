# frozen_string_literal: true

require 'spec_helper'

require_relative '../../day_10/scanner'

RSpec.describe Scanner do
  subject(:scanner) { described_class.new(source) }

  describe '#scan' do
    context 'with a valid source' do
      let(:source) { '<{([{{}}[<[[[<>{}]]]>[]]' }

      it 'consumes the source without raising errors' do
        expect { scanner.scan }.not_to raise_error
      end

      it 'returns unmatched characters' do
        scanner.scan
        expect(scanner.unmatched.join).to eq('<{([')
      end
    end

    context 'with an invalid source' do
      let(:source) { '{([(<{}[<>[]}>{[]{[(<()>' }

      it 'consumes the source without raising errors' do
        expect { scanner.scan }
          .to raise_error(Scanner::InvalidCharacterError, 'Expected ], but found } instead.')
      end
    end
  end
end
