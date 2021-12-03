def find_most_common_bit(bits)
  bits.max_by { |b| bits.count(b) }
end

def find_least_common_bit(bits)
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
