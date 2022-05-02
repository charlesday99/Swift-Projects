// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "FirstServer",
    dependencies: [
        .package(url: "https://github.com/Kitura/Kitura", from: "2.8.0")
    ],
    targets: [
        .target(name: "FirstServer", dependencies: [ .target(name: "Application"), "Kitura"]),
        .target(name: "Application", dependencies: [ "Kitura" ]),

        .testTarget(name: "ApplicationTests" , dependencies: [.target(name: "Application"), "Kitura" ])
    ]
)
