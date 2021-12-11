# frozen_string_literal: true

require_relative './point'
require 'set'

class Grid
  attr_reader :points

  def initialize(heightmap)
    @heightmap = heightmap
    @points = {}
    plot_points
  end

  def find_by_coordinates(x, y)
    points[[x, y].to_s]
  end

  def adjacent_to(point)
    x, y = point.coordinates
    up = find_by_coordinates(x, y - 1)
    right = find_by_coordinates(x + 1, y)
    down = find_by_coordinates(x, y + 1)
    left = find_by_coordinates(x - 1, y)

    [up, right, down, left].reject(&:nil?)
  end

  def low_points
    @low_points ||= points.values.select(&:low_point?)
  end

  def risk_level
    low_points.sum { |point| point.height + 1 }
  end

  def largest_basins_sizes
    basins.map(&:size).sort.reverse.take(3)
  end

  private

  attr_reader :heightmap, :bounds

  def plot_points
    heightmap.each_with_index do |row, y|
      row.each_with_index do |height, x|
        point = Point.new(x, y, height)
        point.grid = self
        points[point.coordinates.to_s] = point
      end
    end
  end

  def basins
    @basins ||= low_points.map { |point| plot_basin(point) }
  end

  def plot_basin(point, basin = Set.new)
    return basin if basin.include?(point)

    basin << point
    adjacent_to(point).each do |adjacent|
      next if adjacent.height == 9

      basin = plot_basin(adjacent, basin)
    end
    basin
  end
end
