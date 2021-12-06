# frozen_string_literal: true

def count_overlaps(segments)
  points = []
  segments.each_with_index do |s1, index|
    segments[index..-1].each do |s2|
      points += overlaping_points(s1, s2)
    end
  end

  dups = Hash.new(0)
  points.each { |point| dups[point] += 1 }

  dups.count { |_, v| v >= 2 }
end

def count_all_overlaps(segments)
  points = []
  segments.each_with_index do |s1, index|
    segments[index..-1].each do |s2|
      points += all_overlaping_points(s1, s2)
    end
  end

  dups = Hash.new(0)
  points.each { |point| dups[point] += 1 }

  dups.count { |_, v| v >= 2 }
end

def all_overlaping_points(s1, s2)
  all_segment_points(s1) & all_segment_points(s2)
end

def overlaping_points(s1, s2)
  segment_points(s1) & segment_points(s2)
end

def overlap?(s1, s2)
  (segment_points(s1) & segment_points(s2)).any?
end

def segment_points(segment)
  x1, y1 = segment[0]
  x2, y2 = segment[1]
  if x1 == x2 # vertical line
    ys = ([y1, y2].min..[y1, y2].max)
    Array.new(ys.size, x1).zip(ys)
  elsif y1 == y2 # horizontal line
    xs = ([x1, x2].min..[x1, x2].max)
    xs.zip(Array.new(xs.size, y1))
  else
    []
  end
end

def all_segment_points(segment)
  x1, y1 = segment[0]
  x2, y2 = segment[1]
  if x1 == x2 # vertical line
    ys = ([y1, y2].min..[y1, y2].max)
    Array.new(ys.size, x1).zip(ys)
  elsif y1 == y2 # horizontal line
    xs = ([x1, x2].min..[x1, x2].max)
    xs.zip(Array.new(xs.size, y1))
  else
    xs = axis_diagonal_points(x1, x2)
    ys = axis_diagonal_points(y1, y2)
    xs.zip(ys)
  end
end

def axis_diagonal_points(ax1, ax2)
  n = ([ax1, ax2].min..[ax1, ax2].max).to_a
  if ax1 > ax2 # subtract
    n.reverse
  else # add
    n
  end
end
