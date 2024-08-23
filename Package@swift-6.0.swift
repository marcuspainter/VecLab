// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "VecLab",
    platforms: [
        .iOS(.v15),
        .macOS(.v12)
    ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "VecLab",
            targets: ["VecLab"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "VecLab",
            dependencies: [],
            resources: [.copy("PrivacyInfo.xcprivacy")],
            cSettings: [
              .define("ACCELERATE_NEW_LAPACK"),
              .define("ACCELERATE_LAPACK_ILP64") // optional
        ]
        ),
        .testTarget(
            name: "VecLabTests",
            dependencies: ["VecLab"]
        )
    ]
)

// https://www.polpiella.dev/version-specific-package-manifests