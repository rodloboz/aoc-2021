import { fuelCosts, enhancedFuelCosts } from '../crabs';

describe('fuelCosts', () => {
  it('returns total fuel cost to reach the common horizontal position that spends the least fuel', () => {
    const input = [16, 1, 2, 0, 4, 2, 7, 1, 2, 14]
    expect(fuelCosts(input)).toEqual(37)
  })
});

describe('enhancedFuelCosts', () => {
  it('returns total fuel cost to reach the common horizontal position that spends the least fuel', () => {
    const input = [16, 1, 2, 0, 4, 2, 7, 1, 2, 14]
    expect(enhancedFuelCosts(input)).toEqual(168)
  })
});
