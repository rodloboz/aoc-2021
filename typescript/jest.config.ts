/*
 * For a detailed explanation regarding each configuration property and type check, visit:
 * https://jestjs.io/docs/configuration
 */

import type {Config} from '@jest/types';
// Sync object
const config: Config.InitialOptions = {
  verbose: true,
  transform: {
    '^.+\\.ts?$': 'ts-jest',
  },
  preset: 'ts-jest',
  clearMocks: true,
  collectCoverage: true,
  collectCoverageFrom: [
    '<rootDir>/**/*.ts',
    '!**/*.d.ts',
    '!**/*.generated.ts',
    '!<rootDir>/index.ts',
    '!<rootDir>/mocks/**',
    '!<rootDir>/testing/**',
    '!<rootDir>/types/**',
  ],
  coverageDirectory: 'coverage',
  rootDir: './src',
  setupFiles: ['<rootDir>/jest.setup.ts']
};

export default config;
