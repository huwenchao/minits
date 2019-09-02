import test from 'ava';
import { runCode } from './util';

const srcNumber = `
function main(): number {
    return 2 > 1? 20 : 10;
}
`;

const srcString = `
function main(): number {
  let a = 2 > 1? "Hello": "World";
  if (a !== "Hello") {
    return 1;
  }
  return 0;
}
`;

test('test condition number', async t => {
  await runCode(srcNumber);
  t.pass();
});

test('test condition string', async t => {
  await runCode(srcString);
  t.pass();
});