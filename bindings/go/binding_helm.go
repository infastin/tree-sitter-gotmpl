package tree_sitter_gotmpl

// #cgo CFLAGS: -std=c11 -fPIC
// #include "../../helm/src/parser.c"
import "C"

import "unsafe"

// Get the tree-sitter Language for this grammar.
func LanguageHelm() unsafe.Pointer {
	return unsafe.Pointer(C.tree_sitter_helm())
}
