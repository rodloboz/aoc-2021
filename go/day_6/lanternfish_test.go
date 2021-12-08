package main

import "testing"

func TestSchoolSize(t *testing.T) {
	initial_state := []uint64{3, 4, 3, 1, 2}
	actual := SchoolSize(initial_state, 80)
	var expected uint64 = 5934

	if expected != actual {
		t.Errorf("Expected '%d', but got '%d'", expected, actual)
	}
}
