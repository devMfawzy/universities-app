// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ListingModule",
    platforms: [.iOS(.v13)],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "ListingModule",
            targets: ["ListingModule"]),
    ],
    dependencies: [
        .package(path: "../ListingRepo"),
        .package(path: "../DetailsModule")
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "ListingModule",
            dependencies: [
                .product(name: "ListingRepo", package: "ListingRepo"),
                .product(name: "DetailsModule", package: "DetailsModule")
            ]
        ),
        .testTarget(
            name: "ListingModuleTests",
            dependencies: ["ListingModule"])
    ]
)
