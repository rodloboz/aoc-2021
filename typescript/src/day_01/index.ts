import * as path from 'path';
import { promises as fs } from 'fs';

import { measureIncrements, slidingWindowIncreases } from './sonar';

const readData = async () => {
  const data = await fs.readFile(filepath, 'utf8');
  return Buffer.from(data).toString('utf-8').replace(/\r\n/g,'\n').split('\n').map(line => parseInt(line, 10))
}

const filepath = path.join(
  __dirname,
  '../../..',
  'data',
  'day_01',
  'input.txt',
);

readData().then(inputs => {
  const result = measureIncrements(inputs);
  const window = slidingWindowIncreases(inputs);

  console.log(`Increases: ${result} | Window: ${window}`);
})


