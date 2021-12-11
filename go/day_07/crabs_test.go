package main

import "testing"

func TestFuelCount(t *testing.T) {
	input := []int{16, 1, 2, 0, 4, 2, 7, 1, 2, 14}
	actual := FuelCount(input)
	var expected int = 37

	if expected != actual {
		t.Errorf("Expected '%d', but got '%d'", expected, actual)
	}
}

func TestEnhancedFuelCount(t *testing.T) {
	input := []int{16, 1, 2, 0, 4, 2, 7, 1, 2, 14}
	actual := EnhancedFuelCount(input)
	var expected int = 168

	if expected != actual {
		t.Errorf("Expected '%d', but got '%d'", expected, actual)
	}
}
