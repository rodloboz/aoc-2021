import * as path from 'path';
import { promises as fs } from 'fs';

import { schoolSize } from './lanternfish';

const readData = async () => {
  const data = await fs.readFile(filepath, 'utf8');
  return Buffer
    .from(data)
    .toString('utf-8')
    .replace(/\r\n/g,'\n')
    .split('\n')[0]
    .split(',')
    .map(numb => parseInt(numb, 10))
}

const filepath = path.join(
  __dirname,
  '../../..',
  'data',
  'day_6',
  'input.txt',
);

readData().then(initial_state => {
  const count_80 = schoolSize(initial_state, 80);
  const count_256 = schoolSize(initial_state, 256);

  console.log(`Total number of fish after 80 days: ${count_80}`);
  console.log(`Total number of fish after 256 days: ${count_256}`);
})


