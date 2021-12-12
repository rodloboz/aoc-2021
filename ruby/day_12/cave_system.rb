# frozen_string_literal: true

require 'byebug'

require 'set'

class CaveSystem
  attr_reader :map

  def initialize(input)
    @map = Hash.new { |h, k| h[k] = [] }
    plot_map(input)
    @paths = []
  end

  def simple_paths
    visit('start', []) { |path, destination| !path.include?(destination) }
    @paths
  end

  def complex_paths
    visit('start', []) { |path, destination| valid_path?(path, destination) }
    @paths
  end

  private

  def visit(start, path, &block)
    path += [start]
    if start == 'end'
      @paths.push(path)
      return
    end

    map[start].each do |destination|
      visit(destination, path, &block) if !small?(destination) || block.call(path, destination)
    end
  end

  def small?(str)
    /[[:lower:]]/.match(str)
  end

  def valid_path?(path, node)
    return true unless path.include?(node)

    visited = Hash.new { |h, k| h[k] = 0 }
    path.select(&method(:small?)).each { |cave| visited[cave] += 1 }

    return false if visited[node] > 1

    visits = visited.values
    (visits.sum - visits.size).zero?
  end

  def plot_map(input)
    input.each do |cave|
      s, e = cave.split('-')
      map[s] << e unless e == 'start' || s == 'end'
      map[e] << s unless s == 'start' || e == 'end'
    end
  end
end
