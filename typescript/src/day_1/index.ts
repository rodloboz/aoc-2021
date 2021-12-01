import * as path from 'path';
import * as fs from 'fs';

import { measureIncrements, slidingWindowIncreases } from './sonar';

const filepath = path.join(
  __dirname,
  '../../..',
  'data',
  'dat_1',
  'inputs.txt',
);

// const inputs: number[] = fs.readFile(filepath, (_err, data) => {
//   return data
//     .toString()
//     .replace(/\r\n/g,'\n')
//     .split('\n')
//     .map(line => parseInt(line, 10))
// });

// const result = measureIncrements(inputs);


