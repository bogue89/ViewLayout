// swift-tools-version:5.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ViewLayout",
    platforms: [
        .iOS(.v11)
    ],
    products: [
        .library(name: "ViewLayout",
                 targets: ["ViewLayout"]),
        .library(name: "AssociatedFactory",
                 targets: ["AssociatedFactory"])
    ],
    dependencies: [],
    targets: [
        .target(name: "ViewLayout", dependencies: [
            "AssociatedFactory"
        ]),
        .target(name: "AssociatedFactory", dependencies: []),
        .testTarget(name: "ViewLayoutTests", dependencies: ["ViewLayout"]),
    ]
)
