// swift-tools-version:5.8
import PackageDescription
import Foundation

let SCADE_SDK = ProcessInfo.processInfo.environment["SCADE_SDK"] ?? ""
let scadeSetting: [SwiftSetting] = [
    .unsafeFlags(["-F", SCADE_SDK], .when(platforms: [.macOS, .iOS])),
    .unsafeFlags(["-I", "\(SCADE_SDK)/include"], .when(platforms: [.android]))
]

let package = Package(
    name: "Swifting",
    platforms: [
        .macOS(.v10_15), .iOS(.v13)
    ],
    products: [
		.library(name: "Swifting", type: .static, targets: ["Swifting"]),
        .library(name: "Services", targets: ["Services"]),
        .library(name: "Core", targets: ["Core"])
    ],
    dependencies: [],
    targets: [
        .target(
            name: "Swifting",
            dependencies: [
                "Services",
            	"Core"
            ],
            exclude: [
                "splash.page",
                "home.page",
                "search.page",
                "detail.page"
            ],
            swiftSettings: scadeSetting
        ),
        .target(
        	name: "Services",
        	dependencies: [
        		"Core"
        	],
            resources: [
                .process("Resources/Services.plist")
            ],
            swiftSettings: scadeSetting
        ),
        .target(
            name: "Core"
        )
    ]
)
