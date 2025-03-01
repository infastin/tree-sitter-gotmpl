from unittest import TestCase

import tree_sitter, tree_sitter_gotmpl


class TestLanguage(TestCase):
    def test_can_load_gotmpl_grammar(self):
        try:
            tree_sitter.Language(tree_sitter_gotmpl.language_gotmpl())
        except Exception:
            self.fail("Error loading Go Template grammar")

    def test_can_load_goyamltmpl_grammar(self):
        try:
            tree_sitter.Language(tree_sitter_gotmpl.language_goyamltmpl())
        except Exception:
            self.fail("Error loading Go YAML Template grammar")
