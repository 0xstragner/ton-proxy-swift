// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ton-proxy-swift",
    platforms: [
        .iOS(.v13),
    ],
    products: [
        .library(name: "TonutilsProxy", targets: ["TonutilsProxy"]),
    ],
    targets: [
        .target(
            name: "TonutilsProxy",
            dependencies: [
                "TonutilsProxyBridge",
            ],
            path: "Sources/TonutilsProxy",
            swiftSettings: [
                .define("DEBUG", .when(configuration: .debug)),
            ]
        ),
        .target(
            name: "TonutilsProxyBridge",
            dependencies: [
                "libTonutilsProxy",
            ],
            path: "Sources/TonutilsProxyBridge",
            publicHeadersPath: "Include",
            cSettings: [
                .define("DEBUG", to: "1", .when(configuration: .debug)),
            ]
        ),
        .binaryTarget(
            name: "libTonutilsProxy",
            path: "Artifacts/TonutilsProxy.xcframework"
        ),
    ]
)
