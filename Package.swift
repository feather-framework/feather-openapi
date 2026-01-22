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
            name: "feather-openapi-generator",
            targets: ["feather-openapi-generator"]
        ),
        .library(
            name: "FeatherOpenAPI",
            targets: ["FeatherOpenAPI"]
        ),
        .plugin(
            name: "FeatherOpenAPIGenerator",
            targets: ["FeatherOpenAPIGenerator"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/mattpolzin/OpenAPIKit", exact: "5.0.0-rc.2"),
        .package(url: "https://github.com/apple/swift-syntax", exact: "602.0.0"),
        .package(url: "https://github.com/jpsim/Yams", from: "6.2.0"),
    ],
    targets: [
        .plugin(
            name: "FeatherOpenAPIGenerator",
            capability: .buildTool(),
            dependencies: [
                .target(name: "feather-openapi-generator")
            ],
        ),
        // MARK: -
        .target(
            name: "FeatherOpenAPI",
            dependencies: [
                .product(name: "OpenAPIKit", package: "OpenAPIKit"),
                .product(name: "OpenAPIKit30", package: "OpenAPIKit"),
                .product(name: "OpenAPIKitCompat", package: "OpenAPIKit"),
                .product(name: "Yams", package: "yams"),
            ],
            swiftSettings: defaultSwiftSettings
        ),
        .target(
            name: "FeatherOpenAPI30",
            dependencies: [
                .product(name: "OpenAPIKit30", package: "OpenAPIKit"),
                .product(name: "OpenAPIKitCompat", package: "OpenAPIKit"),
            ],
            swiftSettings: defaultSwiftSettings
        ),
        .executableTarget(
            name: "feather-openapi-generator",
            dependencies: [
                .product(name: "SwiftParser", package: "swift-syntax")
            ],
            swiftSettings: defaultSwiftSettings,
        ),
        .testTarget(
            name: "FeatherOpenAPITests",
            dependencies: [
                .product(name: "Yams", package: "Yams"),
                .target(name: "FeatherOpenAPI"),
            ],
            swiftSettings: defaultSwiftSettings,
        ),
        .testTarget(
            name: "FeatherOpenAPIPluginTests",
            dependencies: [
                .product(name: "Yams", package: "Yams"),
                .target(name: "FeatherOpenAPI"),
            ],
            swiftSettings: defaultSwiftSettings,
            plugins: [
                .plugin(name: "FeatherOpenAPIGenerator"),
            ]
        ),
        .testTarget(
            name: "FeatherOpenAPI30Tests",
            dependencies: [
                .product(name: "Yams", package: "Yams"),
                .target(name: "FeatherOpenAPI30"),
            ],
            swiftSettings: defaultSwiftSettings,
        ),
    ]
)
