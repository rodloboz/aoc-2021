export const powerConsumption = (inputs: string[]) : number => {
  const bits: Array<string[]> = inputs.map(input => Array.from(input));
  return gammaRate(bits) * epsilonRate(bits);
}

const gammaRate = (bits: Array<string[]>): number => {
  const bitsArr: string[] = []
  for(let i = 0; i < bits[0].length; i++) {
    const column = bits.map(row => row[i])
    bitsArr.push(mostCommonBit(column))
  }
  return parseInt( bitsArr.join(''), 2 );
}

const epsilonRate = (bits: Array<string[]>): number => {
  const bitsArr: string[] = []
  for(let i = 0; i < bits[0].length; i++) {
    const column = bits.map(row => row[i])
    bitsArr.push(mostCommonBit(column) == '1' ? '0' : '1')
  }
  return parseInt( bitsArr.join(''), 2 );
}

export const lifeSupportRating = (inputs: string[]) : number => {
  const bits: Array<string[]> = inputs.map(input => Array.from(input));
  return o2GeneratorRating(bits) * co2ScrubberRating(bits);
}

const o2GeneratorRating = (bits: Array<string[]>): number => {
  let i = 0;
  while (bits.length !== 1) {
    const column = bits.map(row => row[i]);
    const bit = mostCommonBit(column);
    bits = bits.filter(row => row[i] == bit);
    i += 1;
  }
  return parseInt( bits[0].join(''), 2 );
}

const co2ScrubberRating = (bits: Array<string[]>): number => {
  let i = 0;
  while (bits.length !== 1) {
    const column = bits.map(row => row[i]);
    const bit = mostCommonBit(column)  == '1' ? '0' : '1';
    bits = bits.filter(row => row[i] == bit);
    i += 1;
  }
  return parseInt( bits[0].join(''), 2 );
}

const mostCommonBit = (bits: string[], tiebreaker = '1'): string => {
  const modeMap = new Map();
  let mostCommon = bits[0], maxCount = 1;
  for(let i = 0; i < bits.length; i++) {
    let bit = bits[i];
    let count = modeMap.get(bit);
    modeMap.set(bit, count ? count + 1 : 1)

    count = modeMap.get(bit);
    if(count > maxCount || (count == maxCount && bit == tiebreaker)) {
        mostCommon = bit;
        maxCount = modeMap.get(bit);
    }
  }
  return mostCommon;
}
