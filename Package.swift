// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "TreeSitterGoTmpl",
    products: [
        .library(name: "TreeSitterGoTmpl", targets: ["TreeSitterGoTmpl", "TreeSitterGoYAMLTmpl"]),
    ],
    dependencies: [
        .package(url: "https://github.com/ChimeHQ/SwiftTreeSitter", from: "0.8.0"),
    ],
    targets: [
        .target(
            name: "TreeSitterGoTmpl",
            dependencies: [],
            path: ".",
            sources: [
                "gotmpl/src/parser.c",
            ],
            resources: [
                .copy("queries")
            ],
            publicHeadersPath: "bindings/swift/gotmpl",
            cSettings: [
                .headerSearchPath("gotmpl/src"),
            ]
        ),
        .target(
            name: "TreeSitterGoYAMLTmpl",
            dependencies: [],
            path: ".",
            sources: [
                "goyamltmpl/src/parser.c",
            ],
            resources: [
                .copy("queries")
            ],
            publicHeadersPath: "bindings/swift/goyamltmpl",
            cSettings: [
                .headerSearchPath("goyamltmpl/src"),
            ]
        ),
        .testTarget(
            name: "TreeSitterGoTmplTests",
            dependencies: [
                "SwiftTreeSitter",
                "TreeSitterGoTmpl",
                "TreeSitterGoYAMLTmpl",
            ],
            path: "bindings/swift/TreeSitterGoTmplTests"
        )
    ],
    cLanguageStandard: .c11
)
