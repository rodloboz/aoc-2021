import unittest
from lanternfish import school_size

class TestLanternfish(unittest.TestCase):
  def test_school_size(self):
    initial_state = [3, 4, 3, 1, 2]
    days = 80
    self.assertEqual(school_size(initial_state, days), 5934)
