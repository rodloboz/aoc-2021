def most_common_bit(bits)
  return '1' if bits.count('1') == bits.count('0')

  bits.max_by { |b| bits.count(b) }
end

def gamma_rate(inputs)
  bits = inputs.map(&:chars)
  bits.transpose.flat_map do |column|
    most_common_bit(column)
  end.join.to_i(2)
end

def epsilon_rate(inputs)
  bits = inputs.map(&:chars)
  bits.transpose.flat_map do |column|
    most_common_bit(column) == '1' ? '0' : '1'
  end.join.to_i(2)
end

def power_consumption(inputs)
  gamma_rate(inputs) * epsilon_rate(inputs)
end

def o2_generator_rating(inputs)
  bits = inputs.map(&:chars)

  index = 0
  size = bits[0].size
  while bits.size != 1
    bit = most_common_bit(bits.transpose[index])
    bits = bits.select { |b| b[index] == bit }
    index = index == size - 1 ? 0 : index + 1
  end

  bits.flatten.join.to_i(2)
end

def co2_scrubber_rating(inputs)
  bits = inputs.map(&:chars)

  index = 0
  size = bits[0].size
  while bits.size != 1
    bit = most_common_bit(bits.transpose[index]) == '1' ? '0' : '1'
    bits = bits.select { |b| b[index] == bit }
    index = index == size - 1 ? 0 : index + 1
  end

  bits.flatten.join.to_i(2)
end

def life_support_rating(inputs)
  o2_generator_rating(inputs) * co2_scrubber_rating(inputs)
end
