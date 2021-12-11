# frozen_string_literal: true

require 'spec_helper'

require_relative '../../day_06/lanternfish'

RSpec.describe Lanternfish do
  subject(:lanternfish) { described_class.new_school(initial_state) }

  let(:initial_state) { [3, 4, 3, 1, 2] }

  describe '#total_count' do
    it 'returns the total number of fish in the school' do
      expect(lanternfish.total_count).to eq(5)
    end
  end

  describe '#respawn_days' do
    it 'multiplies the fish in the school until the given days' do
      expect(lanternfish.total_count).to eq(5)

      lanternfish.respawn_days(80)

      expect(lanternfish.total_count).to eq(5934)
    end
  end
end
