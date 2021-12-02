# frozen_string_literal: true

def measurement_increases(inputs)
  inputs.each_cons(2).reduce(0) do |acc, (previous, current)|
    current > previous ? acc + 1 : acc
  end
end

def sliding_window_increases(inputs)
  sums = [] of Int32
  inputs.each_cons(3) do |cons|
    sums << cons.sum
  end

  measurement_increases(sums)
end
