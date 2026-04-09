import SwiftUI

extension Font {
    static func kayoDisplay(size: CGFloat) -> Font {
        Font.custom(BrandTokens.Typography.displayFallback, size: size)
    }

    static func kayoBody(size: CGFloat) -> Font {
        Font.system(size: size, weight: .regular, design: .rounded)
    }
}
