import numpy as np
import pandas as pd
import os


def main():
    # load txt file
    dirname = os.path.dirname(__file__)
    filename = os.path.join(dirname, '../../data/day_7/input.txt')
    inp = []
    with open(filename, "r") as f:
        inp += [int(n) for n in f.read().split(",")]
    
    fuel_cost(inp)
    enhanced_fuel_cost(inp)
    
    
def fuel_cost(inp):
    inp = pd.Series(inp)
    sol1 = int(inp.map(lambda x: abs(x - np.median(inp))).sum())
    print(f"Solution 1:\n{sol1}")
    return sol1


def enhanced_fuel_cost(inp):
    def s2(mean):
        return int(inp.map(lambda x: abs(x - mean) * (abs(x - mean) + 1) / 2).sum())
    inp = pd.Series(inp)
    mean = np.mean(inp)
    sol2 = min(s2(mean // 1), s2(mean // 1 + 1))
    print(f"\nSolution 2:\n{sol2}")
    return sol2

if __name__ == "__main__":
    main()