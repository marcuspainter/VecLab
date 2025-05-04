// swift-tools-version:5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "VecLab",
    platforms: [
        .iOS("16.4"), // LAPACK
        .macOS("15.0")
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "VecLab",
            targets: ["VecLab"])
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "VecLab",
            dependencies: [],
            resources: [.process("Resources")],
            cSettings: [.define("ACCELERATE_NEW_LAPACK", to: "1"), .define("ACCELERATE_LAPACK_ILP64", to: "1")],
            cxxSettings: [.define("ACCELERATE_NEW_LAPACK", to: "1"), .define("ACCELERATE_LAPACK_ILP64", to: "1")],
            linkerSettings: [.linkedFramework("Accelerate")]
        ),
        .testTarget(
            name: "VecLabTests",
            dependencies: ["VecLab"]
        )
    ]
)
