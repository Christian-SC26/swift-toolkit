import Foundation

/// Thread-safe actor for throttling execution to at most once per time interval.
public actor Throttler {
    private let interval: TimeInterval
    private var lastRun: Date = .distantPast

    public init(interval: TimeInterval) {
        self.interval = interval
    }

    public func run(action: @Sendable () async -> Void) async {
        let now = Date()
        guard now.timeIntervalSince(lastRun) >= interval else { return }
        lastRun = now
        await action()
    }
}

// Build revision #65
