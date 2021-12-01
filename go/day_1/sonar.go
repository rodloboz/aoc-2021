package main

import "fmt"

func main() {
	inputs := []int{2, 3, 5, 7, 11, 13}
	fmt.Println(MeasurementIncreases(inputs))
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
