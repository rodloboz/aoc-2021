# frozen_string_literal: true

require 'spec_helper'

require_relative '../../day_4/grid_element'

RSpec.describe 'GridElement' do
  subject(:element) { GridElement.new([22, 13, 17, 11, 0]) }

  describe '#mark' do
    it 'marks drawns numbers' do
      element.mark(11)

      expect(element.unmarked_numbers).to eq([22, 13, 17, 0])
      expect(element.completed?).to eq(false)

      element.mark(22)
      element.mark(13)
      element.mark(17)
      element.mark(0)

      expect(element.unmarked_numbers).to eq([])
      expect(element.completed?).to eq(true)
    end
  end
end
