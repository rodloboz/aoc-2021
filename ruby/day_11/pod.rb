# frozen_string_literal: true

require_relative './octopus'
require 'colorize'
require 'set'
require 'byebug'

class Pod
  attr_reader :octopuses, :flash_count, :step_number

  def initialize(grid)
    @grid = grid
    @octopuses = {}
    @flash_count = 0
    @step_number = 0
    map_octopuses
  end

  def find_by_coordinates(x, y)
    octopuses[[x, y].to_s]
  end

  def adjacent_to(octopus)
    x, y = octopus.coordinates
    top = find_by_coordinates(x, y - 1)
    top_right = find_by_coordinates(x + 1, y - 1)
    right = find_by_coordinates(x + 1, y)
    bottom_right = find_by_coordinates(x + 1, y + 1)
    bottom = find_by_coordinates(x, y + 1)
    bottom_left = find_by_coordinates(x - 1, y + 1)
    left = find_by_coordinates(x - 1, y)
    top_left = find_by_coordinates(x - 1, y - 1)

    [top, top_right, right, bottom_right, bottom, bottom_left, left, top_left].reject(&:nil?)
  end

  def step(n = 1)
    @flash_count = 0
    n.times do
      @step_number += 1
      reset
      increment
      update_flash_count
    end
  end

  def display
    to_grid.each do |row|
      row.each do |energy|
        print energy.zero? ? energy.to_s.red : energy.to_s
      end
      puts
    end

    nil
  end

  def to_grid
    row_size = grid.size
    col_size = grid[0].size

    (0...row_size).inject([]) do |acc, x|
      col = []
      (0...col_size).each do |y|
        col << find_by_coordinates(x, y).energy
      end
      acc << col
    end.transpose
  end

  def size
    grid.size * grid[0].size
  end

  private

  attr_reader :grid

  def reset
    octopuses.each_value(&:reset)
  end

  def increment
    octopuses.each_value do |octopus|
      next if octopus.flashed?

      octopus.increment
    end
  end

  def update_flash_count
    @flash_count += octopuses.each_value.count(&:flashed?)
  end

  def map_octopuses
    grid.each_with_index do |row, y|
      row.each_with_index do |energy, x|
        octopus = Octopus.new(x, y, energy)
        octopus.pod = self
        octopuses[octopus.coordinates.to_s] = octopus
      end
    end
  end
end
