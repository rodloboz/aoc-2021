declare type CostFunction = (n: number) => number;

export const fuelCosts = (input: number[]) : number => {
  const mdn = median(input);
  return totalCosts(input, mdn);
}

export const enhancedFuelCosts = (input: number[]) : number => {
  const average = input.reduce((sum, a,i,ar) => {
    sum += a;
    return i==ar.length-1?(ar.length==0?0:sum/ar.length):sum
  },0);
  const mean = Math.floor(average);
  const costFunction = (n: number) => (n * (n + 1) / 2);
  const meanCost = totalCosts(input, mean, costFunction);
  const meanCostP1 = totalCosts(input, mean - 1, costFunction);
  const meanCostM1 = totalCosts(input, mean + 1, costFunction);

  return Math.max.apply(Math, [meanCost, meanCostP1, meanCostM1]);
}

const totalCosts = (
  numbers: number[],
  target: number,
  callback?: CostFunction
) : number => {
  return numbers.reduce((acc, n) => {
    const moves = Math.abs((target - n));

    if(callback && typeof(callback) === "function") {
      return acc += callback(moves);
    }

    return acc += moves;
  }, 0);
}

const median = (numbers: number[]) : number => {
  let middle = Math.floor(numbers.length / 2);
    numbers = [...numbers].sort((a, b) => a - b);
  return numbers.length % 2 !== 0 ? numbers[middle] : (numbers[middle - 1] + numbers[middle]) / 2;
}
