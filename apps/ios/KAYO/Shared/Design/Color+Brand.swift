import SwiftUI

extension Color {
    static let kayoWhite = Color(BrandTokens.Colors.white)
    static let kayoNearWhite = Color(BrandTokens.Colors.nearWhite)
    static let kayoNearBlack = Color(BrandTokens.Colors.nearBlack)
    static let kayoGold = Color(BrandTokens.Colors.gold)

    init(_ brandColor: BrandColor) {
        self.init(
            red: Double(brandColor.red) / 255.0,
            green: Double(brandColor.green) / 255.0,
            blue: Double(brandColor.blue) / 255.0
        )
    }
}
