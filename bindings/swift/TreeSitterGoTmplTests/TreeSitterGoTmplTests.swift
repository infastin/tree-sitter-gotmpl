import XCTest
import SwiftTreeSitter
import TreeSitterGoTmpl

final class TreeSitterGoTmplTests: XCTestCase {
    func testCanLoadGoTmplGrammar() throws {
        let parser = Parser()
        let language = Language(language: tree_sitter_gotmpl())
        XCTAssertNoThrow(try parser.setLanguage(language),
                         "Error loading Go template grammar")
    }

    func testCanLoadHelmGrammar() throws {
        let parser = Parser()
        let language = Language(language: tree_sitter_helm())
        XCTAssertNoThrow(try parser.setLanguage(language),
                         "Error loading Helm grammar")
    }
}
