# frozen_string_literal: true

class Lanternfish
  def self.new_school(initial_state)
    new(initial_state)
  end

  def initialize(initial_state)
    @school = Hash.new(0)
    initial_state.each do |timer|
      school[timer] += 1
    end
  end

  def total_count
    school.values.sum
  end

  def respawn(days)
    days.times do
      temp_map = Hash.new(0)
      temp_map[6] += school[0]
      temp_map[8] += school[0]
      school.each_key do |key|
        next if key.zero?

        temp_map[key - 1] += school[key]
      end
      @school = temp_map.clone
    end
  end

  attr_reader :school
end
