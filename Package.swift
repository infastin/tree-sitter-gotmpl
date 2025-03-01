// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "TreeSitterGoTmpl",
    products: [
        .library(name: "TreeSitterGoTmpl", targets: ["TreeSitterGoTmpl", "TreeSitterHelm"]),
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
            name: "TreeSitterHelm",
            dependencies: [],
            path: ".",
            sources: [
                "helm/src/parser.c",
            ],
            resources: [
                .copy("queries")
            ],
            publicHeadersPath: "bindings/swift/helm",
            cSettings: [
                .headerSearchPath("helm/src"),
            ]
        ),
        .testTarget(
            name: "TreeSitterGoTmplTests",
            dependencies: [
                "SwiftTreeSitter",
                "TreeSitterGoTmpl",
                "TreeSitterHelm",
            ],
            path: "bindings/swift/TreeSitterGoTmplTests"
        )
    ],
    cLanguageStandard: .c11
)
