import unittest
from calem import challenge1, challenge2

class TestChallenge1(unittest.TestCase):
  def test_challenge1(self):
    input = """2199943210
3987894921
9856789892
8767896789
9899965678"""
    self.assertEqual(challenge1(input), 15)

class TestChallenge2(unittest.TestCase):
  def test_challenge2(self):
    input = """2199943210
3987894921
9856789892
8767896789
9899965678"""
    self.assertEqual(challenge2(input), 1134)
