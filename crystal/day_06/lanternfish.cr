def school_size(initial_state, days)
  school = [0,0,0,0,0,0,0,0,0] of UInt128
  initial_state.each do |state|
    school[state] += 1
  end

  days.times do
    zeros = school.shift
    school << zeros
    school[6] += zeros
  end

  school.sum
end

# duration = Time.measure do
#   initial_state = [3, 4, 3, 1, 2] of UInt128
#   days = 256
#   count = school_size(initial_state, days)
#   puts "Count: #{count}"
#   puts "Duration: #{duration}"
# end
