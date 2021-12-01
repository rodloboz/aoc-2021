# pylint: disable-all

import unittest
from sonar import measurement_increases, sliding_window_increases

class TestSonar(unittest.TestCase):
  def test_measurement_increases(self):
    inputs = [199,200,208,210,200,207,240,269,260,263]
    self.assertEqual(measurement_increases(inputs), 7)

  def test_sliding_window_increases(self):
    inputs = [199,200,208,210,200,207,240,269,260,263]
    self.assertEqual(sliding_window_increases(inputs), 5)
