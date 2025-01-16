# SwiftToolkit

[![Swift 5.9+](https://img.shields.io/badge/Swift-5.9%2B-orange.svg)](https://swift.org)
[![Platform](https://img.shields.io/badge/Platforms-macOS%20%7C%20iOS-blue.svg)](https://apple.com)
[![License: MIT](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)

A modular, lightweight collection of essential Swift and SwiftUI utilities, extensions, concurrency primitives, and data structures.

## Features

- **Safe Collections**: `collection[safe: index]` bounds-checked access & chunking.
- **Concurrency Primitives**: Actor-based `Debouncer` and `Throttler` for modern async/await workflows.
- **LRU Cache**: Thread-safe generic Least Recently Used cache implementation.
- **SwiftUI Extensions**: Conditional modifiers (`.if()`, `.hidden(if:)`), Hex Color support.
- **String Helpers**: Trimming, regex matching, smart truncation.

## Installation

Add SwiftToolkit to your `Package.swift`:

```swift
dependencies: [
    .package(url: "https://github.com/Christian-SC26/swift-toolkit.git", from: "1.0.0")
]
```

## Quick Start

### Safe Collection Subscript
```swift
let items = ["Swift", "macOS", "iOS"]
print(items[safe: 1]) // Optional("macOS")
print(items[safe: 5]) // nil (no crash)
```

### Actor-based Debouncing
```swift
let debouncer = Debouncer(delay: 0.3)
await debouncer.debounce {
    await performSearch(query)
}
```

### LRU Cache
```swift
let cache = LRUCache<String, Image>(capacity: 50)
cache.set("avatar", value: userImage)
let image = cache.get("avatar")
```

## License
MIT License. Created by Christian.

<!-- Build revision #181 -->
