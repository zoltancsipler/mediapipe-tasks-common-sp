// swift-tools-version:5.6
import PackageDescription

let package = Package(
    name: "MediaPipeTasksCommon",
    platforms: [
        .iOS(.v15)
    ],
    products: [
        .library(
            name: "MediaPipeTasksCommon",
            type: .static,
            targets: ["MediaPipeTasksCommonTargets"]
        )
    ],
    dependencies: [
    ],
    targets: [
        .binaryTarget(
            name: "MediaPipeTasksCommon",
            url: "https://github.com/zoltancsipler/mediapipe-tasks-common-sp/raw/main/MediaPipeTasksCommon.zip",
            checksum: "8ec4191339dfec16f8a163457834ef2ddfaa58603cd915bdce384101d5f21c20"
        ),
        .target(
            name: "MediaPipeTasksCommonTargets",
            dependencies: [
                .target(name: "MediaPipeTasksCommon"),
            ],
            cxxSettings: [
                .headerSearchPath("frameworks/graph_libraries"),
                .define("LIBCPP_ENABLE_THREAD_SAFETY_ANNOTATIONS", to: "1")
            ],
            linkerSettings: [
                .linkedLibrary("c++"),
                .linkedFramework("Accelerate"),
                .linkedFramework("CoreMedia"),
                .linkedFramework("AssetsLibrary"),
                .linkedFramework("CoreFoundation"),
                .linkedFramework("CoreGraphics"),
                .linkedFramework("CoreImage"),
                .linkedFramework("QuartzCore"),
                .linkedFramework("AVFoundation"),
                .linkedFramework("CoreVideo"),
                .unsafeFlags([
                    "-force_load", "frameworks/graph_libraries/libMediaPipeTasksCommon_device_graph.a"
                ])
            ]
        )
    ]
)
