# pylint: disable=missing-module-docstring

import os
from itertools import repeat

def school_size(initial_state, days):
  school = [0] * 9
  for state in initial_state:
    school[state] += 1

  for _ in repeat(None, days):
    zeros = school.pop(0)
    school.append(zeros)
    school[6] += zeros

  return sum(school)

def main():
  dirname = os.path.dirname(__file__)
  filename = os.path.join(dirname, '../../data/day_06/input.txt')

  with open(filename) as f:
    input = f.read()

  initial_state = list(map(int, input.split(',')))

  count_80 = school_size(initial_state, 80)
  count_256 = school_size(initial_state, 256)

  print("Total number of fish after 80 days: {}".format(count_80))
  print("Total number of fish after 250 days: {}".format(count_256))

if __name__ == '__main__':
    main()

