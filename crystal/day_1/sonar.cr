# frozen_string_literal: true

def measurement_increases(inputs)
  inputs.each_with_index.reduce(0) do |counter, (input, index)|
    if !index.zero? && input > inputs[index - 1]
      counter + 1
    else
      counter
    end
  end
end

def sliding_window_increases(inputs)
  sums = [] of Int32
  inputs.each_cons(3) do |cons|
    sums << cons.sum
  end

  measurement_increases(sums)
end
