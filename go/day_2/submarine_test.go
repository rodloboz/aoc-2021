package main

import "testing"

func TestCalculatePositionAndDepth(t *testing.T) {
	inputs := []Move{{"forward", 5}, {"down", 5}, {"forward", 8}, {"up", 3}, {"down", 8}, {"forward", 2}}
	actual := CalculatePositionAndDepth(inputs)
	var expected = Coordinates{horizontal: 15, depth: 10}

	if expected != actual {
		t.Errorf("Expected '%d', but got '%d'", expected, actual)
	}
}

func TestAdvancedCalculatePositionAndDepth(t *testing.T) {
	inputs := []Move{{"forward", 5}, {"down", 5}, {"forward", 8}, {"up", 3}, {"down", 8}, {"forward", 2}}
	actual := AdvancedCalculatePositionAndDepth(inputs)
	var expected = Coordinates{horizontal: 15, depth: 60}

	if expected != actual {
		t.Errorf("Expected '%d', but got '%d'", expected, actual)
	}
}
