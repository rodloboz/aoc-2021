# pylint: disable=missing-module-docstring

import os

def main():
  dirname = os.path.dirname(__file__)
  filename = os.path.join(dirname, '../../data/day_01/input.txt')

  with open(filename) as f:
    inputs = f.read().splitlines()

  inputs = list(map(int, inputs))

  result =  measurement_increases(inputs)
  window = sliding_window_increases(inputs)

  print("Increases: {} | Window: {}".format(result, window))


def measurement_increases(inputs):
  counter = 0
  for index, input in enumerate(inputs):
    if index != 0 and input > inputs[index-1]: counter += 1

  return counter

def sliding_window_increases(inputs):
  sums = []
  for index, input in enumerate(inputs[:-2]):
    sums.append(input + inputs[index+1] + inputs[index+2])

  return measurement_increases(sums)

if __name__ == '__main__':
    main()
