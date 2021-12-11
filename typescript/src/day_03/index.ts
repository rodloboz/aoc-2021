import * as path from 'path';
import { promises as fs } from 'fs';

import { powerConsumption, lifeSupportRating } from './diagnostic';

const readData = async () : Promise<string[]> => {
  const data = await fs.readFile(filepath, 'utf8');
  return Buffer
    .from(data)
    .toString('utf-8')
    .replace(/\r\n/g,'\n')
    .split('\n')
}

const filepath = path.join(
  __dirname,
  '../../..',
  'data',
  'day_03',
  'input.txt',
);

readData().then(inputs => {
  let pwCons = powerConsumption(inputs)

  console.log(
    `Power Consumption: ${powerConsumption(inputs)} | Life Support Rating: ${lifeSupportRating(inputs)}`
  )
})


