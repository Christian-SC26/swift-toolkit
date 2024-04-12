#if canImport(SwiftUI)
import SwiftUI

public extension View {
    /// Applies the given transform if the given condition evaluates to `true`.
    @ViewBuilder
    func `if`<Content: View>(_ condition: Bool, transform: (Self) -> Content) -> some View {
        if condition {
            transform(self)
        } else {
            self
        }
    }

    /// Hides the view conditionally.
    @ViewBuilder
    func hidden(if shouldHide: Bool) -> some View {
        if shouldHide {
            self.hidden()
        } else {
            self
        }
    }
}
#endif

// Build revision #53
