import Foundation

/// In-memory thread-safe Least Recently Used (LRU) Cache.
public final class LRUCache<Key: Hashable, Value>: @unchecked Sendable {
    private let capacity: Int
    private let lock = NSLock()
    private var storage: [Key: Value] = [:]
    private var order: [Key] = []

    public init(capacity: Int) {
        precondition(capacity > 0, "Capacity must be positive")
        self.capacity = capacity
    }

    public func get(_ key: Key) -> Value? {
        lock.lock()
        defer { lock.unlock() }
        guard let value = storage[key] else { return nil }
        if let idx = order.firstIndex(of: key) {
            order.remove(at: idx)
            order.append(key)
        }
        return value
    }

    public func set(_ key: Key, value: Value) {
        lock.lock()
        defer { lock.unlock() }
        if storage[key] != nil {
            storage[key] = value
            if let idx = order.firstIndex(of: key) {
                order.remove(at: idx)
                order.append(key)
            }
        } else {
            if order.count >= capacity {
                let oldest = order.removeFirst()
                storage.removeValue(forKey: oldest)
            }
            storage[key] = value
            order.append(key)
        }
    }

    public var count: Int {
        lock.lock()
        defer { lock.unlock() }
        return storage.count
    }

    public func removeAll() {
        lock.lock()
        defer { lock.unlock() }
        storage.removeAll()
        order.removeAll()
    }
}

// Build revision #290
