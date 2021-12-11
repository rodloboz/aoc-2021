package main

import "testing"

func TestPowerConsumption(t *testing.T) {
	inputs := []string{
		"00100",
		"11110",
		"10110",
		"10111",
		"10101",
		"01111",
		"00111",
		"11100",
		"10000",
		"11001",
		"00010",
		"01010",
	}
	actual := PowerConsumption(inputs)
	var expected int64 = 198

	if expected != actual {
		t.Errorf("Expected '%d', but got '%d'", expected, actual)
	}
}

func TestMostCommonBit(t *testing.T) {
	bits := []string{"0", "1", "1", "1", "1", "0", "0", "1", "1", "1", "0", "0"}

	actual := MostCommonBit(bits)
	expected := "1"

	if expected != actual {
		t.Errorf("Expected '%v', but got '%v'", expected, actual)
	}
}

func TestGammaRate(t *testing.T) {
	bits := [][]string{
		{"0", "0", "1", "0", "0"},
		{"1", "1", "1", "1", "0"},
		{"1", "0", "1", "1", "0"},
		{"1", "0", "1", "1", "1"},
		{"1", "0", "1", "0", "1"},
		{"0", "1", "1", "1", "1"},
		{"0", "0", "1", "1", "1"},
		{"1", "1", "1", "0", "0"},
		{"1", "0", "0", "0", "0"},
		{"1", "1", "0", "0", "1"},
		{"0", "0", "0", "1", "0"},
		{"0", "1", "0", "1", "0"},
	}
	actual := GammaRate(bits)
	var expected int64 = 22

	if expected != actual {
		t.Errorf("Expected '%d', but got '%d'", expected, actual)
	}
}

func TestEpsilonRate(t *testing.T) {
	bits := [][]string{
		{"0", "0", "1", "0", "0"},
		{"1", "1", "1", "1", "0"},
		{"1", "0", "1", "1", "0"},
		{"1", "0", "1", "1", "1"},
		{"1", "0", "1", "0", "1"},
		{"0", "1", "1", "1", "1"},
		{"0", "0", "1", "1", "1"},
		{"1", "1", "1", "0", "0"},
		{"1", "0", "0", "0", "0"},
		{"1", "1", "0", "0", "1"},
		{"0", "0", "0", "1", "0"},
		{"0", "1", "0", "1", "0"},
	}
	actual := EpsilonRate(bits)
	var expected int64 = 9

	if expected != actual {
		t.Errorf("Expected '%d', but got '%d'", expected, actual)
	}
}

// describe '#gamma_rate' do
// it 'returns the gamma rate of the submarine' do
// 	inputs = %w[
// 		00100
// 		11110
// 		10110
// 		10111
// 		10101
// 		01111
// 		00111
// 		11100
// 		10000
// 		11001
// 		00010
// 		01010
// 	]
// 	expect(gamma_rate(inputs)).to eq(22)
// end
// end
