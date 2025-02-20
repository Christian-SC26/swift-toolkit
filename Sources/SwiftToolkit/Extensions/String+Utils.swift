import Foundation

public extension String {
    /// Returns a trimmed version of the string without surrounding whitespace and newlines.
    var trimmed: String {
        trimmingCharacters(in: .whitespacesAndNewlines)
    }

    /// Validates if string matches a given regular expression pattern.
    func matches(pattern: String) -> Bool {
        range(of: pattern, options: .regularExpression) != nil
    }

    /// Truncates string to a maximum length and appends a trailing indicator.
    func truncated(to length: Int, trailing: String = "…") -> String {
        if count > length {
            return prefix(Swift.max(0, length - trailing.count)) + trailing
        }
        return self
    }
}

// Build revision #202
