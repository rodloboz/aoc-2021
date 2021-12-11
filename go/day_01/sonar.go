package main

import (
	"fmt"
	"os"
	"path/filepath"
	"strconv"
	"strings"
)

func main() {
	absPath, _ := filepath.Abs("../../data/day_01/input.txt")
	content, _ := os.ReadFile(absPath)
	lines := strings.Split(string(content), "\n")
	var inputs []int

	for i := 0; i < len(lines); i++ {
		input, _ := strconv.Atoi(lines[i])
		inputs = append(inputs, input)
	}

	result := MeasurementIncreases(inputs)
	window := SlidingWindowIncreases(inputs)

	s := fmt.Sprintf("Increases: %d | Window: %d", result, window)

	fmt.Println(s)
}

func MeasurementIncreases(inputs []int) int {
	var counter int

	for i := 1; i < len(inputs); i++ {
		if inputs[i] > inputs[i-1] {
			counter++
		}
	}

	return counter
}

func SlidingWindowIncreases(inputs []int) int {
	var sums []int

	for i := 0; i < len(inputs)-2; i++ {
		sums = append(sums, inputs[i]+inputs[i+1]+inputs[i+2])
	}

	return MeasurementIncreases(sums)
}
