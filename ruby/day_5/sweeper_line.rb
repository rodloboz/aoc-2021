class SweeperLine
  def initialize
    @segments = []
    @overlaps = Hash.new { |h, k| h[k] = Hash.new(0) }
  end

  def add_segment(segment)
    @segments << segment
  end

  def remove_segment(segment)
    @segments.delete(segment)
  end

  private

  attr_reader :segments, :overlaps
end
