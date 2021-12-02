package main

import (
	"bufio"
	"fmt"
	"os"
	"path/filepath"
	"strconv"
	"strings"
)

type Coordinates struct {
	horizontal, depth int32
}

type Move struct {
	command string
	value   int32
}

func main() {
	filepath, _ := filepath.Abs("../../data/day_2/input.txt")
	file, _ := os.Open(filepath)
	reader := bufio.NewReader(file)
	var inputs []Move
	line, err := Readln(reader)
	for err == nil {
		move := strings.Split(string(line), " ")
		value, _ := strconv.ParseInt(move[1], 10, 32)
		inputs = append(inputs, Move{move[0], int32(value)})
	}

	coordinates := CalculatePositionAndDepth(inputs)
	position := coordinates.horizontal * coordinates.depth

	s := fmt.Sprintf("Horizontal: %d | Depth: %d | Result: %d", coordinates.horizontal, coordinates.depth, position)

	fmt.Println(s)
}

func CalculatePositionAndDepth(inputs []Move) Coordinates {
	var coordinates = Coordinates{horizontal: 0, depth: 0}

	for i := 0; i < len(inputs); i++ {
		var command string = inputs[i].command
		var value int32 = inputs[i].value

		switch command {
		case "forward":
			coordinates.horizontal += value
		case "down":
			coordinates.depth += value
		case "up":
			coordinates.depth -= value
		}
	}

	return coordinates
}

func AdvancedCalculatePositionAndDepth(inputs []Move) Coordinates {
	var coordinates = Coordinates{horizontal: 0, depth: 0}
	var aim int32 = 0

	for i := 0; i < len(inputs); i++ {
		var command string = inputs[i].command
		var value int32 = inputs[i].value

		switch command {
		case "forward":
			coordinates.horizontal += value
			coordinates.depth += aim * value
		case "down":
			aim += value
		case "up":
			aim -= value
		}
	}

	return coordinates
}

func Readln(r *bufio.Reader) (string, error) {
	var (
		isPrefix bool  = true
		err      error = nil
		line, ln []byte
	)
	for isPrefix && err == nil {
		line, isPrefix, err = r.ReadLine()
		ln = append(ln, line...)
	}
	return string(ln), err
}
