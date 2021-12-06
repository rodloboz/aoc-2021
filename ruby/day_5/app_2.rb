# frozen_string_literal: true

require_relative './segment'
require_relative './sweepper_line'

FILEPATH = '../../data/day_5/input.txt'
filepath = File.expand_path(FILEPATH, File.dirname(__FILE__))

segments = []
File.read(filepath).split("\n").each do |segment|
  points = segment.map { |s| s.split(' -> ') }
  segments << Segment.new(points.split(',').map(&:to_i))
end

.reject(&:empty?).map { |s| s.split('->') }



@input = segments.map { |s| s.map { |p| p.strip.split(',').map(&:to_i) } }

