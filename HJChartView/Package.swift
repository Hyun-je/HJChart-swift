// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "HJChartView",
    platforms: [
        .iOS(.v13),
    ],
    products: [
        .library(
            name: "HJChartView",
            targets: ["HJChartView"]),
        .library(
            name: "HJRingChartView",
            targets: ["HJRingChartView"]),
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "HJChartView",
            dependencies: []),
        .target(
            name: "HJRingChartView",
            dependencies: []),
    ]
)
