package main

func SchoolSize(initial_state []uint64, days int) uint64 {
	var school [9]uint64
	var count uint64

	for i := 0; i < len(initial_state); i++ {
		school[initial_state[i]] += 1
	}

	for i := 0; i < days; i++ {
		zeros := school[0]
		for j := 1; j < len(school); j++ {
			school[j-1] = school[j]
		}
		school[8] = zeros
		school[6] += zeros
	}

	for j := 1; j < len(school); j++ {
		count += school[j]
	}

	return count
}
