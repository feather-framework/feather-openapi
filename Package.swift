// swift-tools-version:6.1
import PackageDescription

import CompilerPluginSupport

// NOTE: https://github.com/swift-server/swift-http-server/blob/main/Package.swift
var defaultSwiftSettings: [SwiftSetting] =
[
    // https://github.com/swiftlang/swift-evolution/blob/main/proposals/0441-formalize-language-mode-terminology.md
    .swiftLanguageMode(.v6),
    // https://github.com/swiftlang/swift-evolution/blob/main/proposals/0444-member-import-visibility.md
    .enableUpcomingFeature("MemberImportVisibility"),
    // https://forums.swift.org/t/experimental-support-for-lifetime-dependencies-in-swift-6-2-and-beyond/78638
    .enableExperimentalFeature("Lifetimes"),
    // https://github.com/swiftlang/swift/pull/65218
    .enableExperimentalFeature("AvailabilityMacro=featherOpenAPI 1.0:macOS 15.0, iOS 18.0, tvOS 18.0, watchOS 11.0, visionOS 2.0"),
]

#if compiler(>=6.2)
defaultSwiftSettings.append(
    // https://github.com/swiftlang/swift-evolution/blob/main/proposals/0461-async-function-isolation.md
    .enableUpcomingFeature("NonisolatedNonsendingByDefault")
)
#endif

let package = Package(
    name: "feather-openapi",
    platforms: [
        .macOS(.v15),
        .iOS(.v18),
        .tvOS(.v18),
        .watchOS(.v11),
        .visionOS(.v2),
    ],
    products: [
        .executable(
            name: "feather-openapikit-generator",
            targets: ["feather-openapikit-generator"]
        ),
        .library(
            name: "FeatherOpenAPI",
            targets: ["FeatherOpenAPI"]
        ),
        .plugin(
            name: "FeatherOpenAPIKitGenerator",
            targets: ["FeatherOpenAPIKitGenerator"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/mattpolzin/OpenAPIKit", exact: "5.0.0-rc.2"),
        .package(url: "https://github.com/apple/swift-syntax", exact: "602.0.0"),
        .package(url: "https://github.com/jpsim/Yams", from: "6.2.0"),
    ],
    targets: [
        .plugin(
            name: "FeatherOpenAPIKitGenerator",
            capability: .buildTool(),
            dependencies: [
                .target(name: "feather-openapikit-generator")
            ],
        ),
        // MARK: -
        .executableTarget(
            name: "feather-openapikit-generator",
            dependencies: [
                .product(name: "SwiftParser", package: "swift-syntax")
            ],
            swiftSettings: defaultSwiftSettings,
        ),
        .target(
            name: "FeatherOpenAPIKit",
            dependencies: [
                .product(name: "OpenAPIKit30", package: "OpenAPIKit"),
                
            ],
            swiftSettings: defaultSwiftSettings
        ),
        .target(
            name: "FeatherOpenAPI",
            dependencies: [
                .product(name: "OpenAPIKit30", package: "OpenAPIKit"),
            ],
            swiftSettings: defaultSwiftSettings
        ),
        // MARK: -
        .testTarget(
            name: "FeatherOpenAPIKitTests",
            dependencies: [
                .product(name: "Yams", package: "Yams"),
                .product(name: "OpenAPIKit", package: "OpenAPIKit"),
                .product(name: "OpenAPIKitCompat", package: "OpenAPIKit"),
                .target(name: "FeatherOpenAPIKit"),
            ],
            swiftSettings: defaultSwiftSettings,
        ),
        .testTarget(
            name: "FeatherOpenAPIKitPluginTests",
            dependencies: [
                .product(name: "Yams", package: "Yams"),
                .product(name: "OpenAPIKit", package: "OpenAPIKit"),
                .product(name: "OpenAPIKitCompat", package: "OpenAPIKit"),
                .target(name: "FeatherOpenAPIKit"),
            ],
            swiftSettings: defaultSwiftSettings,
            plugins: [
                .plugin(name: "FeatherOpenAPIKitGenerator"),
            ]
        ),
        .testTarget(
            name: "FeatherOpenAPITests",
            dependencies: [
                .product(name: "Yams", package: "Yams"),
                .product(name: "OpenAPIKit", package: "OpenAPIKit"),
                .product(name: "OpenAPIKitCompat", package: "OpenAPIKit"),
                .target(name: "FeatherOpenAPI"),
            ],
            swiftSettings: defaultSwiftSettings,
        ),
    ]
)
