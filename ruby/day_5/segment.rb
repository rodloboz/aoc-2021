class Segment
  def initialize(points)
    @left = points[0]
    @right = points[1]
  end

  def starting_point
    @left
  end

  def ending_point
    @right
  end

  def point_at?(coordinates)
    points.include?(coordinates)
  end

  def all_points
    points
  end

  private

  def points
    @points ||= begin
      x1, y1 = starting_point
      x2, y2 = ending_point

      x_axis = points_between(x1, x2)
      y_axis = points_between(y1, y2)
      x_axis.fill(x2, x_axis.size...y_axis.size)
      y_axis.fill(y2, y_axis.size...x_axis.size)
      x_axis.zip(y_axis)
    end
  end

  def points_between(a, b)
    a > b ? (b..a).to_a.reverse : (a..b).to_a
  end
end
