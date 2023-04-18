// swift-tools-version: 5.4
import PackageDescription

let package = Package(
    name: "STLayoutDSL",
    products: [
        .library(
            name: "STLayoutDSL",
            targets: ["STLayoutDSL"]),
    ],
    targets: [
        .target(
            name: "STLayoutDSL",
            dependencies: []),
        .testTarget(
            name: "STLayoutDSLTests",
            dependencies: ["STLayoutDSL"]),
    ]
)
