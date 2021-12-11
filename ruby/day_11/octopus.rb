# frozen_string_literal: true

require 'forwardable'

class Octopus
  class InvalidOctopus < StandardError; end

  attr_reader :energy
  attr_writer :flashed
  attr_accessor :pod

  def initialize(x, y, energy)
    @x = x
    @y = y
    @energy = energy
    @flashed = false

    raise InvalidOctopus, 'Invalid coordinates!' if x.nil? || y.nil?
    raise InvalidOctopus, 'Invalid energy!' if energy.nil? || energy.negative? || energy > 9
  end

  def coordinates
    [@x, @y]
  end

  def increment
    if flash?
      @flashed = true
      flash!
    else
      @energy += 1
    end
  end

  def flashed?
    @flashed
  end

  def reset
    @flashed = false
  end

  protected

  def flash?
    !flashed? && energy >= 9
  end

  private

  def flash!
    @energy = 0
    touch_adjacent
  end

  def touch_adjacent
    adjacent.each do |adjacent|
      next if adjacent.flashed?

      adjacent.increment
    end
  end

  def adjacent
    @adjacent ||= pod.nil? ? [] : pod.adjacent_to(self)
  end
end
