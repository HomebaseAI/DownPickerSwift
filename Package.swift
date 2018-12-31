// swift-tools-version:4.2
//
//  DownPicker.swift
//  DownPicker
//
//  Created by HomebaseAI on 23/10/15.
//  Copyright © 2017 chickdan. All rights reserved.
//

import PackageDescription

let package = Package(
    name: "DownPicker",
    products: [
        .library(
            name: "DownPicker",
            targets: ["DownPicker"]),
        ],
    dependencies: [],
    targets: [
        .target(
            name: "DownPicker",
            dependencies: [],
            path: "Sources"),
        .testTarget(
            name: "DownPickerTests",
            dependencies: ["DownPicker"],
            path: "Tests")
    ]
)
