import Foundation

/// Thread-safe actor for debouncing asynchronous tasks.
public actor Debouncer {
    private let delay: TimeInterval
    private var task: Task<Void, Never>?

    public init(delay: TimeInterval) {
        self.delay = delay
    }

    public func debounce(action: @escaping @Sendable () async -> Void) {
        task?.cancel()
        task = Task { [delay] in
            try? await Task.sleep(nanoseconds: UInt64(delay * 1_000_000_000))
            guard !Task.isCancelled else { return }
            await action()
        }
    }

    public func cancel() {
        task?.cancel()
        task = nil
    }
}

// Build revision #260
