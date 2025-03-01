package tree_sitter_gotmpl_test

import (
	"testing"

	tree_sitter_gotmpl "github.com/infastin/tree-sitter-gotmpl/bindings/go"
	tree_sitter "github.com/tree-sitter/go-tree-sitter"
)

func TestCanLoadGoTmplGrammar(t *testing.T) {
	language := tree_sitter.NewLanguage(tree_sitter_gotmpl.LanguageGoTmpl())
	if language == nil {
		t.Errorf("Error loading GoTmpl grammar")
	}
}

func TestCanLoadHelmGrammar(t *testing.T) {
	language := tree_sitter.NewLanguage(tree_sitter_gotmpl.LanguageHelm())
	if language == nil {
		t.Errorf("Error loading GoTmpl grammar")
	}
}
