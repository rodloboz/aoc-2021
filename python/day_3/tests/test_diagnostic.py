import os
import unittest

from diagnostic import diagnostic, oxygen_generator_rating, co2_scrubber_rating

class TestDay3(unittest.TestCase):
    filepath = os.path.join(os.path.dirname(__file__), './test_input.txt')

    def test_diagnostic(self):
      gamma, epsilon = diagnostic(self.filepath)
      g = int(gamma, 2)
      e = int(epsilon, 2)

      self.assertEqual(g*e, 198)


    def test_oxygen_generator_rating(self):
      rating = oxygen_generator_rating(self.filepath)

      self.assertEqual(int(rating, 2), 23)


    def test_co2_generator_rating(self):
      rating = co2_scrubber_rating(self.filepath)

      self.assertEqual(int(rating, 2), 10)
