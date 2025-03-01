//! This crate provides Go template language support for the [tree-sitter][] parsing library.
//!
//! Typically, you will use the [LANGUAGE_GOTMPL][] constant to add this language to a
//! tree-sitter [Parser][], and then use the parser to parse some code:
//!
//! ```
//! let code = r#"
//! "#;
//! let mut parser = tree_sitter::Parser::new();
//! let language = tree_sitter_gotmpl::LANGUAGE_GOTMPL;
//! parser
//!     .set_language(&language.into())
//!     .expect("Error loading Go template parser");
//! let tree = parser.parse(code, None).unwrap();
//! assert!(!tree.root_node().has_error());
//! ```
//!
//! [Parser]: https://docs.rs/tree-sitter/*/tree_sitter/struct.Parser.html
//! [tree-sitter]: https://tree-sitter.github.io/

use tree_sitter_language::LanguageFn;

extern "C" {
    fn tree_sitter_gotmpl() -> *const ();
    fn tree_sitter_helm() -> *const ();
}

/// The tree-sitter [`LanguageFn`][LanguageFn] for Go template grammar.
///
/// [LanguageFn]: https://docs.rs/tree-sitter-language/*/tree_sitter_language/struct.LanguageFn.html
pub const LANGUAGE_GOTMPL: LanguageFn = unsafe { LanguageFn::from_raw(tree_sitter_gotmpl) };

/// The tree-sitter [`LanguageFn`][LanguageFn] for Helm grammar.
///
/// [LanguageFn]: https://docs.rs/tree-sitter-language/*/tree_sitter_language/struct.LanguageFn.html
pub const LANGUAGE_HELM: LanguageFn = unsafe { LanguageFn::from_raw(tree_sitter_helm) };

/// The content of the [`node-types.json`][] file for Go template grammar.
///
/// [`node-types.json`]: https://tree-sitter.github.io/tree-sitter/using-parsers#static-node-types
pub const GOTMPL_NODE_TYPES: &str = include_str!("../../gotmpl/src/node-types.json");

/// The content of the [`node-types.json`][] file for Helm grammar.
///
/// [`node-types.json`]: https://tree-sitter.github.io/tree-sitter/using-parsers#static-node-types
pub const HELM_NODE_TYPES: &str = include_str!("../../helm/src/node-types.json");

// NOTE: uncomment these to include any queries that this grammar contains:

// pub const HIGHLIGHTS_QUERY: &str = include_str!("../../queries/highlights.scm");
// pub const INJECTIONS_QUERY: &str = include_str!("../../queries/injections.scm");
// pub const LOCALS_QUERY: &str = include_str!("../../queries/locals.scm");
// pub const TAGS_QUERY: &str = include_str!("../../queries/tags.scm");

#[cfg(test)]
mod tests {
    #[test]
    fn test_can_load_gotmpl_grammar() {
        let mut parser = tree_sitter::Parser::new();
        parser
            .set_language(&super::LANGUAGE_GOTMPL.into())
            .expect("Error loading Go template parser");
    }

    #[test]
    fn test_can_load_helm_grammar() {
        let mut parser = tree_sitter::Parser::new();
        parser
            .set_language(&super::LANGUAGE_HELM.into())
            .expect("Error loading Helm parser");
    }
}
