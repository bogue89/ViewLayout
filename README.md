# ViewLayout

ViewLayout is an UIView-associated manager for anchors, using layout guides to resolve constraints.

## Xcode

In `Package Dependencies` inside your project file paste the repo url `https://github.com/bogue89/ViewLayout` in the field "Search or Enter Package URL".

Set the Dependency Rule to Up to Next Major Version using the latest `ViewLayout` [release](https://github.com/bogue89/ViewLayout/releases)

Resolve Package Versions

## Swift Package Manager

#### Add dependencies

Add the `ViewLayout` package to the dependencies within your application’s `Package.swift` file. Substitute `"x.x.x"` with the latest `ViewLayout` [release](https://github.com/bogue89/ViewLayout/releases).

```swift
.package(url: "https://github.com/bogue89/ViewLayout.git", from: "x.x.x")
```

Add `ViewLayout` to your target's dependencies:

```swift
.target(name: "example", dependencies: ["ViewLayout"]),
```

## Uses

#### Import package

```swift
import ViewLayout
```

#### Uses

```swift
let view = UIView()
let layout: ViewLayout = view.layout // this lazily initialize the ViewLayout manager for this view instance
```

### Swift version

The latest version of ViewLayout requires **Swift 5.0** or later. You can download this version of the Swift binaries by following this [link](https://swift.org/download/).

iOS v.11 is required for anchoring layout composition.
