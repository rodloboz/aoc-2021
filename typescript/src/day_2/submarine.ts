export interface Coordinates {
  horizontal: number;
  depth: number;
}

export interface Move {
  command: string;
  value: number;
}

export const calculatePositionAndDepth = (inputs: Move[]) : Coordinates => {
  const coordinates = { horizontal: 0, depth: 0 };

  inputs.forEach(input => {
    switch (input.command) {
      case 'forward':
        coordinates.horizontal += input.value;
        break;
      case 'down':
        coordinates.depth += input.value;
        break;
      case 'up':
        coordinates.depth -= input.value;
        break;
    }
  })

  return coordinates;
}

export const advancedCalculatePositionAndDepth = (inputs: Move[]) : Coordinates => {
  const coordinates = { horizontal: 0, depth: 0 };
  let aim = 0;

  inputs.forEach(input => {
    switch (input.command) {
      case 'forward':
        coordinates.horizontal += input.value;
        coordinates.depth += aim * input.value;
        break;
      case 'down':
        aim += input.value;
        break;
      case 'up':
        aim -= input.value;
        break;
    }
  })

  return coordinates;
}
