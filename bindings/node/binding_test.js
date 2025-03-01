const assert = require('node:assert');
const { test } = require('node:test');

const Parser = require('tree-sitter');

test('can load Go template grammar', () => {
  const parser = new Parser();
  assert.doesNotThrow(() => parser.setLanguage(require('./gotmpl')));
});

test('can load Helm grammar', () => {
  const parser = new Parser();
  assert.doesNotThrow(() => parser.setLanguage(require('./helm')));
});
