class GridElement
  attr_reader :numbers

  def initialize(numbers)
    @numbers = {}
    numbers.each do |number|
      @numbers[number] = false
    end
  end

  def mark(drawn_number)
    numbers.each do |number, _marked|
      numbers[number] = true if number == drawn_number
    end
  end

  def unmarked_numbers
    numbers.reject { |number, marked| marked }.keys
  end

  def completed?
    numbers.all? { |_k, marked| marked }
  end
end
