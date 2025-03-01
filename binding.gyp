{
  "targets": [
    {
      "target_name": "tree_sitter_gotmpl_binding",
      "dependencies": [
        "<!(node -p \"require('node-addon-api').targets\"):node_addon_api_except",
      ],
      "include_dirs": [
        "gotmpl/src",
        "goyamltmpl/src",
      ],
      "sources": [
        "gotmpl/src/parser.c",
        "goyamltmpl/src/parser.c",
        "bindings/node/binding.cc",
      ],
      "conditions": [
        ["OS!='win'", {
          "cflags_c": [
            "-std=c11",
          ],
        }, { # OS == "win"
          "cflags_c": [
            "/std:c11",
            "/utf-8",
          ],
        }],
      ],
    }
  ]
}
