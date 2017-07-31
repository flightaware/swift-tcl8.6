# SwiftTcl8_6

A Swift modulemap for libtcl8.6 support in Swift.

### Installation

```
make install
```

### Usage

You use this modulemap to provide the Swift bindings to the Tcl8.6 C functions.  Therefore, you have to include this as
a dependency of another module.

```
import PackageDescription

let package = Package(
    name: "SwiftTcl",
	dependencies: [ .Package(url: "https://github.com/flightaware/swift-tcl8.6.git", versions: Version(1,0,0)..<Version(2,0,0)) ]
)

```

### SwiftTcl needs helpers for C macros

The Tcl reference counting APIs are C macros.  Swift's modulemap support cannot transform C macros into Swift functions.
Therefore, we create a helper library to be statically linked, libtclrefcount8.6.a.
