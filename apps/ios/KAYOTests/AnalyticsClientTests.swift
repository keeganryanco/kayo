import XCTest
@testable import KAYO

final class AnalyticsClientTests: XCTestCase {
    func testEventAllowlistRawValues() {
        let expected = Set([
            "app_opened",
            "onboarding_started",
            "onboarding_completed",
            "focus_session_started",
            "focus_session_completed",
            "paywall_viewed",
            "subscription_status_checked"
        ])
        XCTAssertEqual(Set(AnalyticsEvent.allCases.map(\.rawValue)), expected)
    }

    func testPropertyAllowlistRawValues() {
        let expected = Set(["experiment_id", "variant_id", "source", "screen_name"])
        XCTAssertEqual(Set(AnalyticsPropertyKey.allCases.map(\.rawValue)), expected)
    }
}
