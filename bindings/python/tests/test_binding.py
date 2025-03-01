from unittest import TestCase

import tree_sitter, tree_sitter_gotmpl


class TestLanguage(TestCase):
    def test_can_load_gotmpl_grammar(self):
        try:
            tree_sitter.Language(tree_sitter_gotmpl.language_gotmpl())
        except Exception:
            self.fail("Error loading Go template grammar")

    def test_can_load_helm_grammar(self):
        try:
            tree_sitter.Language(tree_sitter_gotmpl.language_helm())
        except Exception:
            self.fail("Error loading Helm grammar")
