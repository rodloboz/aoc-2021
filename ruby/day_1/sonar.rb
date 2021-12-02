# frozen_string_literal: true

def measurement_increases(inputs)
  inputs.each_cons(2).inject(0) do |acc, (previous, current)|
    current > previous ? acc + 1 : acc
  end
end

def sliding_window_increases(inputs)
  measurement_increases(inputs.each_cons(3).map(&:sum))
end
