import unittest
from crabs import fuel_cost, enhanced_fuel_cost

class TestFuelCost(unittest.TestCase):
  def test_fuel_cost(self):
    input = [16, 1, 2, 0, 4, 2, 7, 1, 2, 14]
    self.assertEqual(fuel_cost(input), 37)

class TestEnhancedFuelCost(unittest.TestCase):
  def test_enhanced_fuel_cost(self):
    input = [16, 1, 2, 0, 4, 2, 7, 1, 2, 14]
    self.assertEqual(enhanced_fuel_cost(input), 168)
