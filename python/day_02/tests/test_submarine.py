# pylint: disable-all

import unittest
from submarine import calculate_position_and_depth, advanced_calculate_position_and_depth

class TestSubmarine(unittest.TestCase):
  def test_calculate_position_and_depth(self):
    inputs = [
        ['forward', 5],
        ['down', 5],
        ['forward', 8],
        ['up', 3],
        ['down', 8],
        ['forward', 2]
      ]
    self.assertEqual(calculate_position_and_depth(inputs), {'horizontal': 15, 'depth': 10})

  def test_advanced_calculate_position_and_depth(self):
    inputs = [
        ['forward', 5],
        ['down', 5],
        ['forward', 8],
        ['up', 3],
        ['down', 8],
        ['forward', 2]
      ]
    self.assertEqual(advanced_calculate_position_and_depth(inputs), {'horizontal': 15, 'depth': 60})
