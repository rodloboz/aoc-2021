package main

import "testing"

func TestMeasurementIncreases(t *testing.T) {
	inputs := []int{199, 200, 208, 210, 200, 207, 240, 269, 260, 263}
	got := MeasurementIncreases(inputs)
	want := 7

	if want != got {
		t.Errorf("Expected '%d', but got '%d'", want, got)
	}
}
