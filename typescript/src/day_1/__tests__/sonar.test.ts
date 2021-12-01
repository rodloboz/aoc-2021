import { measureIncrements, slidingWindowIncreases } from '../sonar';


describe('measureIncrements', () => {
  it('returns the number of times the sum of measurements increases', () => {
    const inputs = [199,200,208,210,200,207,240,269,260,263]
    expect(measureIncrements(inputs)).toEqual(7)
  })
});

describe('slidingWindowIncreases', () => {
  it('returns the number of times the sum of measurements increases', () => {
    const inputs = [199,200,208,210,200,207,240,269,260,263]
    expect(slidingWindowIncreases(inputs)).toEqual(5)
  })
});
