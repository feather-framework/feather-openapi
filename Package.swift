// swift-tools-version:6.4
import PackageDescription

let swiftSettings: [SwiftSetting] = [
    .swiftLanguageMode(.v6),
    .strictMemorySafety(),
    .treatAllWarnings(as: .error),
    .enableUpcomingFeature("ExistentialAny"),
    .enableUpcomingFeature("InternalImportsByDefault"),
    .enableUpcomingFeature("MemberImportVisibility"),
    .enableUpcomingFeature("InferIsolatedConformances"),
    .enableUpcomingFeature("NonisolatedNonsendingByDefault"),
    .enableUpcomingFeature("ImmutableWeakCaptures"),
    .enableExperimentalFeature("SuppressedAssociatedTypesWithDefaults"),
    .enableExperimentalFeature("LifetimeDependence"),
    .enableExperimentalFeature("Lifetimes"),
    .enableUpcomingFeature("LifetimeDependence"),
    .enableUpcomingFeature("ImmutableWeakCaptures"),
    .enableExperimentalFeature("StrictConcurrency=complete"),
]

let package = Package(
    name: "application",
    platforms: [
        .macOS(.v15),
        .iOS(.v18),
        .tvOS(.v18),
        .watchOS(.v11),
        .visionOS(.v2),
    ],
    products: [
        .library(name: "FeatherOpenAPI", targets: ["FeatherOpenAPI"]),
    ],
    dependencies: [
        .package(url: "https://github.com/mattpolzin/OpenAPIKit", exact: "7.0.0-beta.3"),
        .package(url: "https://github.com/jpsim/Yams", from: "6.2.0"),
        // [docc-plugin-placeholder]
    ],
    targets: [
        .target(
            name: "FeatherOpenAPI",
            dependencies: [
                .product(name: "OpenAPIKit30", package: "OpenAPIKit"),
            ],
            swiftSettings: swiftSettings
        ),
        .testTarget(
            name: "FeatherOpenAPITests",
            dependencies: [
                .product(name: "Yams", package: "Yams"),
                .product(name: "OpenAPIKit", package: "OpenAPIKit"),
                .product(name: "OpenAPIKitCompat", package: "OpenAPIKit"),
                .target(name: "FeatherOpenAPI"),
            ],
            swiftSettings: swiftSettings,
        ),
    ]
)
