def power_consumption(inputs)
  numbers = inputs.map &.codepoints
  number_length = numbers[0].size
  half = numbers.size / 2

  gamma_list = (0...number_length).map do |col|
    zero_count = numbers.transpose[col].count { |n| n == "0".codepoint_at(0) }
    zero_count > half ? "0".codepoint_at(0) : "1".codepoint_at(0)
  end
  gamma_rate = gamma_list.map(&.chr).join.to_i(2)

  mask = 2 ** number_length - 1
  epsilon_rate = ~gamma_rate & mask

  gamma_rate * epsilon_rate
end

def life_support_rating(inputs)
  numbers = inputs.map &.codepoints
  o2_generator_rating(numbers) * co2_scrubber_rating(numbers)
end

def o2_generator_rating(numbers, col = 0)
  zero_count = numbers.transpose[col].count { |n| n == "0".codepoint_at(0) }
  one_count = numbers.size - zero_count
  to_keep = one_count >= zero_count ? "1".codepoint_at(0) : "0".codepoint_at(0)
  numbers = numbers.select { |n| n[col] == to_keep }

  if numbers.size == 1
    numbers.flatten.map(&.chr).join.to_i(2)
  else
    o2_generator_rating(numbers, col + 1)
  end
end

def co2_scrubber_rating(numbers, col = 0)
  zero_count = numbers.transpose[col].count { |n| n == "0".codepoint_at(0) }
  one_count = numbers.size - zero_count
  to_keep = zero_count <= one_count ? "0".codepoint_at(0) : "1".codepoint_at(0)
  numbers = numbers.select { |n| n[col] == to_keep }

  if numbers.size == 1
    numbers.flatten.map(&.chr).join.to_i(2)
  else
    co2_scrubber_rating(numbers, col + 1)
  end
end
