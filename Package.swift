// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "TextEngine",
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "TextEngine",
            targets: ["TextEngine"]),
        .library(
            name: "TKTextEngine",
            targets: ["TKTextEngine"]
        ),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
        .package(url: "https://github.com/SwiftStudies/TiledKit", from: "0.6.0"),
        .package(url: "https://github.com/SwiftStudies/TiledResources.git",from: "0.1.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "TextEngine",
            dependencies: []),
        .target(
            name: "TKTextEngine",
            dependencies: ["TiledKit"]),
        .testTarget(
            name: "TKTextEngineTests",
            dependencies: ["TKTextEngine","TiledKit","TextEngine","TiledResources"]
            ),
        .testTarget(
            name: "TextEngineTests",
            dependencies: ["TextEngine","TiledKit","TiledResources"]),
    ]
)
