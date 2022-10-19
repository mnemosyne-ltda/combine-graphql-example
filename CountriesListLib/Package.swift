// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "CountriesListLib",
    platforms: [
        .iOS(.v15),
        .macOS(.v10_15),
    ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "CountriesListLib",
            targets: ["CountriesListLib"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        .package(url: "https://github.com/apollographql/apollo-ios", .upToNextMajor(from: "1.0.0")),
        .package(url: "https://github.com/hmlongco/Factory", .upToNextMajor(from: "1.2.8")),
        .package(name: "SchemaLib", path: "./SchemaLib"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "CountriesListLib",
            dependencies: [
                .product(name: "Apollo", package: "apollo-ios"),
                .product(name: "Factory", package: "Factory"),
                .product(name: "SchemaLib", package: "SchemaLib"),
            ]
        ),
        .testTarget(
            name: "CountriesListLibTests",
            dependencies: [
                .product(name: "ApolloTestSupport", package: "apollo-ios"),
                .product(name: "SchemaLibTestMocks", package: "SchemaLib"),
                "CountriesListLib",
            ]),
    ]
)
