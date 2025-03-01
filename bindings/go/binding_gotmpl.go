package tree_sitter_gotmpl

// #cgo CFLAGS: -std=c11 -fPIC
// #include "../../gotmpl/src/parser.c"
import "C"

import "unsafe"

// Get the tree-sitter Language for this grammar.
func LanguageGoTmpl() unsafe.Pointer {
	return unsafe.Pointer(C.tree_sitter_gotmpl())
}
