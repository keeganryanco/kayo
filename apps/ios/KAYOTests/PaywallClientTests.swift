import XCTest
@testable import KAYO

final class PaywallClientTests: XCTestCase {
    func testUnknownStatusWhenRevenueCatKeyMissing() {
        let config = AppConfig(
            postHogAPIKey: "",
            postHogHost: "",
            revenueCatAPIKey: "",
            revenueCatEntitlementID: "pro"
        )

        let client = RevenueCatPaywallClient(config: config)
        XCTAssertEqual(client.currentEntitlementStatus(), .unknown)
    }

    func testVariantFallsBackToControl() {
        let config = AppConfig(
            postHogAPIKey: "",
            postHogHost: "",
            revenueCatAPIKey: "test",
            revenueCatEntitlementID: "pro"
        )

        let client = RevenueCatPaywallClient(config: config)
        XCTAssertEqual(client.activePaywallVariant(experimentID: nil), "control")
    }
}
