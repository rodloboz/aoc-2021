import os

def main():
  dirname = os.path.dirname(__file__)
  filename = os.path.join(dirname, '../../data/day_02/input.txt')
  inputs = []

  with open(filename) as f:
    lines = f.readlines()

    for line in lines:
      command, value = line.split()
      inputs.append([command, int(value)])

  coordinates = calculate_position_and_depth(inputs)
  position = coordinates['horizontal'] * coordinates['depth']

  print("Horizontal: {} | Depth: {} | Result: {}".format(coordinates['horizontal'], coordinates['depth'], position))

  print('====== CALCULATING USING ADVANCED OPERATION ==========')

  coordinates = advanced_calculate_position_and_depth(inputs)
  position = coordinates['horizontal'] * coordinates['depth']

  print("Horizontal: {} | Depth: {} | Result: {}".format(coordinates['horizontal'], coordinates['depth'], position))

def calculate_position_and_depth(inputs):
  coordinates = { 'horizontal': 0, 'depth': 0}

  for command, value in inputs:
    if command == 'forward':
      coordinates['horizontal'] += value
    elif command == 'down':
      coordinates['depth'] += value
    elif command == 'up':
      coordinates['depth'] -= value

  return coordinates

def advanced_calculate_position_and_depth(inputs):
  coordinates = { 'horizontal': 0, 'depth': 0}
  aim = 0

  for command, value in inputs:
    if command == 'forward':
      coordinates['horizontal'] += value
      coordinates['depth'] += aim * value
    elif command == 'down':
      aim += value
    elif command == 'up':
      aim -= value

  return coordinates

if __name__ == '__main__':
    main()
