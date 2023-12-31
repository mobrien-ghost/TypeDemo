// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "TypeDemo",
    platforms: [.macOS(.v10_15)],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "TypeDemo",
            targets: ["TypeDemo"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/CheekyGhost-Labs/SyntaxSparrow.git", from: "1.4.0")
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "TypeDemo",
            dependencies: [
                .product(name: "SyntaxSparrow", package: "SyntaxSparrow")
            ]
        ),
        .testTarget(
            name: "TypeDemoTests",
            dependencies: ["TypeDemo"]
        ),
    ]
)
