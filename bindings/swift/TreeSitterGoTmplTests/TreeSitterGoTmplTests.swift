import XCTest
import SwiftTreeSitter
import TreeSitterGoTmpl

final class TreeSitterGoTmplTests: XCTestCase {
    func testCanLoadGoTmplGrammar() throws {
        let parser = Parser()
        let language = Language(language: tree_sitter_gotmpl())
        XCTAssertNoThrow(try parser.setLanguage(language),
                         "Error loading Go Template grammar")
    }

    func testCanLoadGoYAMLTmplGrammar() throws {
        let parser = Parser()
        let language = Language(language: tree_sitter_goyamltmpl())
        XCTAssertNoThrow(try parser.setLanguage(language),
                         "Error loading Go YAML Template grammar")
    }
}
