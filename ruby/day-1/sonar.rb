# frozen_string_literal: true

def measurement_increases(inputs)
  inputs.each_with_index.inject(0) do |counter, (input, index)|
    if !index.zero? && input > inputs[index - 1]
      counter + 1
    else
      counter
    end
  end
end

def sliding_window_increases(inputs)
  sums = inputs[0..inputs.size - 3].map.with_index do |input, index|
    input + inputs[index + 1] + inputs[index + 2]
  end

  measurement_increases(sums)
end
