const root = require("path").join(__dirname, "..", "..");

module.exports =
  typeof process.versions.bun === "string"
    // Support `bun build --compile` by being statically analyzable enough to find the .node file at build-time
    ? require(`../../prebuilds/${process.platform}-${process.arch}/tree-sitter-gotmpl.node`)
    : require("node-gyp-build")(root);

try {
  module.exports.gotmpl.nodeTypeInfo = require("../../gotmpl/src/node-types.json");
  module.exports.goyamltmpl.nodeTypeInfo = require("../../goyamltmpl/src/node-types.json");
} catch (_) { }
