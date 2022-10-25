// swift-tools-version: 5.7

import PackageDescription

let package = Package(
  name: "EnumRuntimeBug",
  dependencies: [
    .package(url: "https://github.com/ole/Echo", branch: "fix-release-build"),
  ],
  targets: [
    .executableTarget(
      name: "EnumRuntimeBug",
      dependencies: [.product(name: "Echo", package: "Echo")]
    ),
  ]
)
