import XCTest
import SwiftTreeSitter
import TreeSitterGoTmpl

final class TreeSitterGoTmplTests: XCTestCase {
    func testCanLoadGrammar() throws {
        let parser = Parser()
        let language = Language(language: tree_sitter_gotmpl())
        XCTAssertNoThrow(try parser.setLanguage(language),
                         "Error loading GoTmpl grammar")
    }
}
