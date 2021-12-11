package main

import "testing"

func TestMeasurementIncreases(t *testing.T) {
	inputs := []int{199, 200, 208, 210, 200, 207, 240, 269, 260, 263}
	actual := MeasurementIncreases(inputs)
	expected := 7

	if expected != actual {
		t.Errorf("Expected '%d', but got '%d'", expected, actual)
	}
}

func TestSlidingWindowIncreases(t *testing.T) {
	inputs := []int{199, 200, 208, 210, 200, 207, 240, 269, 260, 263}
	actual := SlidingWindowIncreases(inputs)
	expected := 5

	if expected != actual {
		t.Errorf("Expected '%d', but got '%d'", expected, actual)
	}
}
