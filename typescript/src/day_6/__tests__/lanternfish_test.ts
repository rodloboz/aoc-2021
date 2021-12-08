import { schoolSize } from '../lanternfish';

describe('schoolSize', () => {
  it('returns the total number of fish after the given days', () => {
    const initial_state = [3, 4, 3, 1, 2]
    expect(schoolSize(initial_state, 80)).toEqual(5934)
  })
});
