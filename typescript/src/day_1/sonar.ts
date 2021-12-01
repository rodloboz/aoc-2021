export const measureIncrements = (inputs: number[]): number => {
  return inputs.reduce((acc, input, index) => {
    if (index !== 0 && input > inputs[index-1]) {
      return acc += 1;
    }

    return acc
  }, 0)
}

export const slidingWindowIncreases = (inputs: number[]): number => {
  const sums: number[] = [];

  for (let i = 0; i < inputs.length - 2; i++) {
    sums.push(inputs[i] + inputs[i + 1] + inputs[i + 2]);
  }

  return measureIncrements(sums);
}
