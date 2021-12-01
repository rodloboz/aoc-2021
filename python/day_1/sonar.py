# pylint: disable=missing-module-docstring

def measurement_increases(inputs):
  counter = 0
  for index, input in enumerate(inputs):
    if index != 0 and input > inputs[index-1]: counter += 1

  return counter

def sliding_window_increases(inputs):
  sums = []
  for index, input in enumerate(inputs[:-2]):
    sums.append(input + inputs[index+1] + inputs[index+2])
  print(sums)
  return measurement_increases(sums)
