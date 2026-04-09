import XCTest
@testable import KAYO

final class DesignTokenSmokeTests: XCTestCase {
    func testGoldColorValuesMatchBrandPalette() {
        XCTAssertEqual(BrandTokens.Colors.gold.red, 243)
        XCTAssertEqual(BrandTokens.Colors.gold.green, 201)
        XCTAssertEqual(BrandTokens.Colors.gold.blue, 94)
    }
}
