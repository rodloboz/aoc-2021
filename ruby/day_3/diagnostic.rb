def find_most_common_bit(bits)
  return "1" if bits.size == 2

  bits.max_by { |b| bits.count(b) }
end

def find_least_common_bit(bits)
  return "0" if bits.size == 2

  bits.min_by { |b| bits.count(b) }
end

def calculate_gamma_rate(inputs)
  bits = inputs.map(&:chars)
  (0...bits[0].size).flat_map do |index|
    find_most_common_bit(bits.transpose[index])
  end.join.to_i(2)
end

def calculate_epsilon_rate(inputs)
  bits = inputs.map(&:chars)
  (0...bits[0].size).flat_map do |index|
    find_least_common_bit(bits.transpose[index])
  end.join.to_i(2)
end

def calculate_power_consumption(inputs)
  gamma_rate = calculate_gamma_rate(inputs)
  epsilon_rate = calculate_epsilon_rate(inputs)
  gamma_rate * epsilon_rate
end

def calculate_oxygen_generator_rating(inputs)
  bits = inputs.map(&:chars)

  index = 0
  size = bits[0].size
  while index < size && bits.size != 1
    bit = find_most_common_bit(bits.transpose[index])
    bits = bits.select { |b| b[index] == bit }
    index += 1
  end

  bits.flatten.join.to_i(2)
end

def calculate_co2_scrubber_rating(inputs)
  bits = inputs.map(&:chars)

  index = 0
  size = bits[0].size
  while index < size && bits.size != 1
    bit = find_least_common_bit(bits.transpose[index])
    bits = bits.select { |b| b[index] == bit }
    index += 1
  end

  bits.flatten.join.to_i(2)
end

def calculate_life_support_rating(inputs)
  oxygen_generator_rating = calculate_oxygen_generator_rating(inputs)
  co2_scrubber_rating = calculate_co2_scrubber_rating(inputs)
  oxygen_generator_rating * co2_scrubber_rating
end
