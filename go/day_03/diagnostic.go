package main

import (
	"strconv"
	"strings"
)

// s := fmt.Sprintf("============>>>>>: %v", column)
// 		fmt.Println(s)

func PowerConsumption(inputs []string) int64 {
	bits := make([][]string, 0)
	for _, binary := range inputs {
		bits = append(bits, strings.Split(binary, ""))
	}
	return GammaRate(bits) * EpsilonRate(bits)
}

func GammaRate(bits [][]string) int64 {
	bitsArr := make([]string, 0)
	for i := 0; i < len(bits[0]); i++ {
		column := make([]string, 0)
		for _, row := range bits {
			column = append(column, row[i])
		}

		bit := MostCommonBit(column)
		bitsArr = append(bitsArr, bit)
	}

	binary := strings.Join(bitsArr[:], "")
	result, _ := strconv.ParseInt(binary, 2, 64)

	return result
}

func EpsilonRate(bits [][]string) int64 {
	bitsArr := make([]string, 0)
	for i := 0; i < len(bits[0]); i++ {
		column := make([]string, 0)
		for _, row := range bits {
			column = append(column, row[i])
		}
		bit := MostCommonBit(column)
		if bit == "1" {
			bit = "0"
		} else {
			bit = "1"
		}
		bitsArr = append(bitsArr, bit)
	}

	binary := strings.Join(bitsArr[:], "")
	result, _ := strconv.ParseInt(binary, 2, 64)

	return result
}

func MostCommonBit(bits []string) string {
	var modeMap = make(map[string]int)
	var mostCommon string = bits[0]
	var maxCount int = 1

	for i := 0; i < len(bits); i++ {
		bit := bits[i]
		count, present := modeMap[bit]
		modeMap[bit] += 1

		if !present {
			modeMap[bit] = 1
		} else {
			modeMap[bit]++
		}

		if count+1 > maxCount || (count == maxCount && bit == "1") {
			mostCommon = bit
			maxCount = count + 1
		}
	}

	return mostCommon
}
