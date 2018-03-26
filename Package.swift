// swift-tools-version:4.0
import PackageDescription

let package = Package(
    name: "ApiCore",
    products: [
        .library(name: "ApiCore", targets: ["ApiCore"]),
        .library(name: "ApiCoreTestTools", targets: ["ApiCoreTestTools"])
    ],
    dependencies: [
        .package(url: "https://github.com/vapor/vapor.git", from: "3.0.0-rc.2"),
        .package(url: "https://github.com/vapor/fluent.git", from: "3.0.0-rc.2"),
        .package(url: "https://github.com/vapor/fluent-postgresql.git", from: "1.0.0-rc.2"),
        .package(url: "https://github.com/vapor/jwt.git", from: "3.0.0-rc.2"),
        .package(url: "https://github.com/vapor/leaf.git", from: "3.0.0-rc.2"),
        .package(url: "https://github.com/LiveUI/DbCore.git", .branch("master")),
        .package(url: "https://github.com/LiveUI/MailCore.git", .branch("master")),
        .package(url: "https://github.com/LiveUI/ErrorsCore.git", .branch("master")),
        .package(url: "https://github.com/LiveUI/VaporTestTools.git", .branch("master")),
        .package(url: "https://github.com/LiveUI/FluentTestTools.git", .branch("master"))
    ],
    targets: [
        .target(
            name: "App",
            dependencies: [
                "Vapor",
                "ApiCore"
            ]
        ),
        .target(name: "Run", dependencies: [
            "App"
            ]
        ),
        .target(name: "ApiCore", dependencies: [
            "Vapor",
            "Fluent",
            "FluentPostgreSQL",
            "ErrorsCore",
            "DbCore",
            "JWT",
            "MailCore",
            "Leaf"
            ]
        ),
        .target(
            name: "ApiCoreTestTools",
            dependencies: [
                "Vapor",
                "ApiCore",
                "VaporTestTools",
                "FluentTestTools",
                "MailCoreTestTools"
            ]
        ),
        .testTarget(name: "ApiCoreTests", dependencies: [
            "ApiCore",
            "VaporTestTools",
            "FluentTestTools",
            "ApiCoreTestTools"
            ]
        )
    ]
)