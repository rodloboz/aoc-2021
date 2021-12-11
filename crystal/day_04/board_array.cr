class BoardArray
  @score : Int32

  getter :score

  def initialize(numbers : Array(Int32))
    @unmatched = numbers
    @matched = [] of Int32
    @score = numbers.sum
  end

  def match(number)
    return unless unmatched.delete(number)

    matched << number
    @score -= number
  end

  def completed?
    unmatched.empty?
  end

  def unmatched_numbers
    @unmatched
  end

  private getter :unmatched, :matched
end
