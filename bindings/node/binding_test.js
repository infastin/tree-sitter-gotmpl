const assert = require('node:assert');
const { test } = require('node:test');

const Parser = require('tree-sitter');

test('can load Go Template grammar', () => {
  const parser = new Parser();
  assert.doesNotThrow(() => parser.setLanguage(require('./gotmpl')));
});

test('can load Go YAML Template grammar', () => {
  const parser = new Parser();
  assert.doesNotThrow(() => parser.setLanguage(require('./goyamltmpl')));
});
