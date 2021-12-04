import { powerConsumption,lifeSupportRating } from '../diagnostic';

describe('powerConsumption', () => {
  it('returns the power consumption of the submarine', () => {
    const inputs = [
      '00100',
      '11110',
      '10110',
      '10111',
      '10101',
      '01111',
      '00111',
      '11100',
      '10000',
      '11001',
      '00010',
      '01010'
    ]
    expect(powerConsumption(inputs)).toEqual(198)
  })
});

describe('lifeSupportRating', () => {
  it('returns the life support rating of the submarine', () => {
    const inputs = [
      '00100',
      '11110',
      '10110',
      '10111',
      '10101',
      '01111',
      '00111',
      '11100',
      '10000',
      '11001',
      '00010',
      '01010'
    ]
    expect(lifeSupportRating(inputs)).toEqual(230)
  })
});
