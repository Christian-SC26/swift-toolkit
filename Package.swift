// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "SwiftToolkit",
    platforms: [
        .macOS(.v13),
        .iOS(.v16)
    ],
    products: [
        .library(
            name: "SwiftToolkit",
            targets: ["SwiftToolkit"]
        ),
    ],
    targets: [
        .target(
            name: "SwiftToolkit",
            dependencies: [],
            path: "Sources/SwiftToolkit"
        ),
        .testTarget(
            name: "SwiftToolkitTests",
            dependencies: ["SwiftToolkit"],
            path: "Tests/SwiftToolkitTests"
        ),
    ]
)

// Build revision #143
