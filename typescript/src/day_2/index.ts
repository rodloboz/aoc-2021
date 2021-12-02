import * as path from 'path';
import { promises as fs } from 'fs';

import { advancedCalculatePositionAndDepth, calculatePositionAndDepth, Move } from './submarine';

const readData = async () : Promise<Move[]> => {
  const data = await fs.readFile(filepath, 'utf8');
  return Buffer
    .from(data)
    .toString('utf-8')
    .replace(/\r\n/g,'\n')
    .split('\n')
    .map(line => {
      const [command, value] = line.split(' ');
      return {command, value: parseInt(value, 10)}
    })
}

const filepath = path.join(
  __dirname,
  '../../..',
  'data',
  'day_2',
  'input.txt',
);

readData().then(inputs => {
  let coordinates = calculatePositionAndDepth(inputs)
  let position = coordinates.horizontal * coordinates.depth

  console.log(`Horizontal: ${coordinates.horizontal} | Depth: ${coordinates.depth} | Result: ${position}`)

  console.log('====== CALCULATING USING ADVANCED OPERATION ==========')

  coordinates = advancedCalculatePositionAndDepth(inputs)
  position = coordinates.horizontal * coordinates.depth

  console.log(`Horizontal: ${coordinates.horizontal} | Depth: ${coordinates.depth} | Result: ${position}`)
})


