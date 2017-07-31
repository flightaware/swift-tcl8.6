# SwiftTcl8_6

A Swift modulemap for libtcl8.6 support in Swift.

### Usage

You use this modulemap to provide the Swift bindings to the Tcl8.6 C functions.  Therefore, you have to include this as
a dependency of another module.

```
import PackageDescription

let package = Package(
    name: "SwiftTcl",
	dependencies: [ .Package(url: "https://github.com/snoe925/SwiftTcl8_6.git", versions: Version(1,0,0)..<Version(2,0,0)) ]
)

```

Then when you link that module into an executable or library, you have to include the linker options to add the Tcl8.6
functions to the runtime.

```
swift build -Xswiftc -emit-library -Xswiftc -o -Xswiftc libBanana.so -Xswiftc -Xlinker -Xswiftc -ltcl8.6 -Xswiftc -Xlinker -Xswiftc -ltclrefcount8.6 -Xswiftc -Xlinker -Xswiftc -ltclstub8.6  -Xswiftc -Xlinker -Xswiftc -lz
```

### SwiftTcl needs helpers for C macros

The Tcl reference counting APIs are C macros.  Swift's modulemap support cannot transform C macros into Swift functions.
Therefore, we create a helper library to be statically linked, libtclrefcount8.6.a.

On Linux you will need to link Tcl and this helper to make a functioning SwiftTcl Tcl extension.

```
swift build -Xswiftc -emit-library -Xswiftc -o -Xswiftc libBanana.so -Xlinker -ltcl8.6 -Xlinker -ltclrefcount -Xlinker -ltclstub8.6 -Xlinker -lz
```
