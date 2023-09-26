// swift-tools-version:5.8
import PackageDescription
import Foundation

let SCADE_SDK = ProcessInfo.processInfo.environment["SCADE_SDK"] ?? ""

let package = Package(
    name: "Swifting",
    platforms: [
        .macOS(.v10_14)
    ],
    products: [
		.library(name: "Swifting", type: .static, targets: ["Swifting"])
    ],
    dependencies: [],
    targets: [
        .target(
            name: "Swifting",
            dependencies: [],
            exclude: [
                "splash.page",
                "home.page",
                "detail.page"
            ],
            swiftSettings: [
                .unsafeFlags(["-F", SCADE_SDK], .when(platforms: [.macOS, .iOS])),
                .unsafeFlags(["-I", "\(SCADE_SDK)/include"], .when(platforms: [.android]))
            ]
        )
    ]
)
