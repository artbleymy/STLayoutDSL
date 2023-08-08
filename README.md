**STLayoutDSL** is a simple DSL for using auto-layout in Swift with declarative style

- [Installation](#installation)
- [Usage](#usage)
- [License](#license)

## Installation

The [Swift Package Manager](https://swift.org/package-manager/) is a tool for automating the distribution of Swift code and is integrated into the `swift` compiler.

Once you have your Swift package set up, adding **STLayoutDSL** as a dependency is as easy as adding it to the `dependencies` value of your `Package.swift`.

```swift
dependencies: [
    .package(url: "https://github.com/artbleymy/STLayoutDSL.git", .upToNextMajor(from: "0.0.1"))
]
```

For adding to Xcode project: 
1. Go to your project settings in Xcode
2. Select *Package Dependencies* tab
3. Tap *Plus* button
4. Paste `https://github.com/artbleymy/STLayoutDSL.git` into search field
5. Tap *Add package*

## Usage

- Pin edges
```swift
    let firstSubview = UIView()
    view.addSubview(firstSubview)
    firstSubview
        .pinEdgesToSuperview([.init(.leading, inset: 30), .init(.trailing, inset: 30)])

    let secondSubview = UIView()
    view.addSubview(secondSubview)
    secondSubview
        .pinEdgesToSuperview([.init(.leading, inset: 20), .init(.trailing, inset: 20)])
        .pinEdgesToSafeArea([.top, .bottom])
```

- Pin axes
```swift
    let subview = UIView()
    view.addSubview(subview)
    subview
        .pinAxesToSuperview([.init(.horizontal, offset: 100)])
```

- Set size
```swift
    let subview = UIView()
    view.addSubview(subview)
    subview
        .setDimension([.height(20), .width(50)])
```

- Setup multiple relations
```swift
    let yellowView = colorView(color: .yellow)
    view.addSubview(yellowView)
    yellowView
        .pinEdgesToSuperview([.init(.leading, inset: 30), .init(.trailing, inset: 30)])
        .setDimension([.height(70)])
        .pinAxesToSuperview([.init(.horizontal, offset: 100)])
```

## License

**STLayoutDSL** is released under the Apache license 2.0. [See LICENSE](https://github.com/artbleymy/STLayoutDSL/blob/main/LICENSE) for details.

