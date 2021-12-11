package main

import (
	"sort"
)

func FuelCount(input []int) int {
	mdn := Median(input)
	return TotalCost(input, mdn)
}

func EnhancedFuelCount(input []int) int {
	mean := Mean(input)
	mean_costs := EnhancedTotalCost(input, mean)
	meanP1_costs := EnhancedTotalCost(input, mean+1)
	meanM1_costs := EnhancedTotalCost(input, mean-1)
	costs := []int{mean_costs, meanP1_costs, meanM1_costs}

	return Min(costs)
}

func TotalCost(numbers []int, target int) int {
	costs := 0
	for i := 0; i < len(numbers); i++ {
		moves := Abs(target - numbers[i])
		costs += moves
	}

	return costs
}

func EnhancedTotalCost(numbers []int, target int) int {
	costs := 0
	for i := 0; i < len(numbers); i++ {
		n := numbers[i]
		moves := Abs(target - n)
		costs += moves + (n * (n + 1) / 2)
	}

	return costs
}

func Median(numbers []int) int {
	sort.Ints(numbers)

	n := len(numbers) / 2

	if n%2 == 0 {
		return (numbers[n-1] + numbers[n]) / 2
	}

	return numbers[n]
}

func Mean(numbers []int) int {
	total := 0

	for _, v := range numbers {
		total += v
	}

	return total / len(numbers)
}

func Abs(x int) int {
	if x < 0 {
		return -x
	}
	return x
}

func Min(numbers []int) int {
	min := numbers[0]
	for _, n := range numbers {
		if n < min {
			min = n
		}
	}
	return min
}
