import XCTest
@testable import SwiftToolkit

final class SwiftToolkitTests: XCTestCase {
    func testCollectionSafeSubscript() {
        let array = ["Alpha", "Beta", "Gamma"]
        XCTAssertEqual(array[safe: 0], "Alpha")
        XCTAssertEqual(array[safe: 2], "Gamma")
        XCTAssertNil(array[safe: 5])
        XCTAssertNil(array[safe: -1])
    }

    func testArrayChunking() {
        let numbers = [1, 2, 3, 4, 5]
        let chunks = numbers.chunked(into: 2)
        XCTAssertEqual(chunks.count, 3)
        XCTAssertEqual(chunks[0], [1, 2])
        XCTAssertEqual(chunks[1], [3, 4])
        XCTAssertEqual(chunks[2], [5])
    }

    func testLRUCacheCapacity() {
        let cache = LRUCache<String, Int>(capacity: 2)
        cache.set("k1", value: 100)
        cache.set("k2", value: 200)
        XCTAssertEqual(cache.get("k1"), 100)
        cache.set("k3", value: 300)
        XCTAssertNil(cache.get("k2"), "k2 should be evicted as oldest")
        XCTAssertEqual(cache.get("k1"), 100)
        XCTAssertEqual(cache.get("k3"), 300)
    }

    func testStringTrimming() {
        let str = "  hello world \n\t"
        XCTAssertEqual(str.trimmed, "hello world")
        XCTAssertEqual("SwiftToolkit".truncated(to: 5), "Swi…")
    }
}

// Build revision #96
