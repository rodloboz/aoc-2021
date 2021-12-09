# frozen_string_literal: true

require 'forwardable'
class Point
  class InvalidPoint < StandardError; end

  include Comparable
  extend Forwardable

  attr_reader :height
  attr_accessor :adjacent, :grid

  def_delegators :coordinates, :hash

  def initialize(x, y, height)
    @x = x
    @y = y
    @height = height
    @adjacent = []

    raise InvalidPoint, 'Invalid coordinates!' if x.nil? || y.nil?
    raise InvalidPoint, 'Invalid height!' if height.nil? || height.negative? || height > 9
  end

  def coordinates
    [@x, @y]
  end

  def low_point?
    @low_point ||= height < grid.adjacent_to(self).map(&:height).min
  end

  def <=>(other)
    coordinates <=> other.coordinates
  end

  def eql?(other)
    coordinates == other.coordinates
  end

  private

  def adjacent_heights; end
end
