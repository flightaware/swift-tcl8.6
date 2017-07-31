// swift-tools-version:3.1

import PackageDescription

// We include the C helper code here but
// you should install this code in /usr/lib/xx86_64-linux-gnu/libtclrefcount8.6.a
// to make it easy to use a link SwiftTcl

let package = Package(
    name: "Tcl8_6",
    // This C code excluded from the Swift build
    // Build and install this static library with make
    exclude: ["c"]
)

