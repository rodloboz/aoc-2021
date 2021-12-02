import { advancedCalculatePositionAndDepth, calculatePositionAndDepth } from '../submarine';

describe('calculatePositionAndDepth', () => {
  it('returns the horizontal position and depth after a planned course', () => {
    const inputs = [
      { 'command': 'forward', 'value': 5},
      { 'command': 'down', 'value': 5},
      { 'command': 'forward', 'value': 8},
      { 'command': 'up', 'value': 3},
      { 'command': 'down', 'value': 8},
      { 'command': 'forward', 'value': 2}
    ]
    expect(calculatePositionAndDepth(inputs)).toEqual({horizontal: 15, depth: 10})
  })
});

describe('advancedCalculatePositionAndDepth', () => {
  it('returns the horizontal position and depth after a planned course', () => {
    const inputs = [
      { 'command': 'forward', 'value': 5},
      { 'command': 'down', 'value': 5},
      { 'command': 'forward', 'value': 8},
      { 'command': 'up', 'value': 3},
      { 'command': 'down', 'value': 8},
      { 'command': 'forward', 'value': 2}
    ]
    expect(advancedCalculatePositionAndDepth(inputs)).toEqual({horizontal: 15, depth: 60})
  })
});
