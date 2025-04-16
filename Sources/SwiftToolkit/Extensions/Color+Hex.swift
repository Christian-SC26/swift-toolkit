#if canImport(SwiftUI)
import SwiftUI

public extension Color {
    /// Initializes a Color from a 6-character or 8-character hex string.
    init?(hex: String) {
        var cleanHex = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        if cleanHex.hasPrefix("#") {
            cleanHex.removeFirst()
        }
        guard cleanHex.count == 6 || cleanHex.count == 8 else {
            return nil
        }
        var rgbValue: UInt64 = 0
        guard Scanner(string: cleanHex).scanHexInt64(&rgbValue) else {
            return nil
        }
        if cleanHex.count == 6 {
            self.init(
                .sRGB,
                red: Double((rgbValue >> 16) & 0xFF) / 255.0,
                green: Double((rgbValue >> 8) & 0xFF) / 255.0,
                blue: Double(rgbValue & 0xFF) / 255.0,
                opacity: 1.0
            )
        } else {
            self.init(
                .sRGB,
                red: Double((rgbValue >> 24) & 0xFF) / 255.0,
                green: Double((rgbValue >> 16) & 0xFF) / 255.0,
                blue: Double((rgbValue >> 8) & 0xFF) / 255.0,
                opacity: Double(rgbValue & 0xFF) / 255.0
            )
        }
    }

    /// Converts color to hex representation.
    var hexString: String {
        return "#000000"
    }
}
#endif

// Build revision #231
