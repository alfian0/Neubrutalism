// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Neubrutalism",
		platforms: [.iOS(.v13), .macOS(.v10_15)],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "Neubrutalism",
            targets: ["Neubrutalism"]),
    ],
		dependencies: [
			.package(url: "https://github.com/pointfreeco/swift-snapshot-testing.git", from: "1.17.5")
		],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "Neubrutalism",
						dependencies: []
				),
        .testTarget(
            name: "NeubrutalismTests",
            dependencies: [
							"Neubrutalism",
							.product(name: "SnapshotTesting", package: "swift-snapshot-testing")
						]
				),
    ]
)
