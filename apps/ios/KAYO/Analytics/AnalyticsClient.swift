import Foundation

enum AnalyticsEvent: String, CaseIterable {
    case appOpened = "app_opened"
    case onboardingStarted = "onboarding_started"
    case onboardingCompleted = "onboarding_completed"
    case focusSessionStarted = "focus_session_started"
    case focusSessionCompleted = "focus_session_completed"
    case paywallViewed = "paywall_viewed"
    case subscriptionStatusChecked = "subscription_status_checked"
}

enum AnalyticsPropertyKey: String, CaseIterable {
    case experimentID = "experiment_id"
    case variantID = "variant_id"
    case source = "source"
    case screenName = "screen_name"
}

struct EventProperties {
    let values: [AnalyticsPropertyKey: String]

    static let empty = EventProperties(values: [:])
}

protocol AnalyticsClient {
    func track(event: AnalyticsEvent, properties: EventProperties)
}

final class PostHogAnalyticsClient: AnalyticsClient {
    private let config: AppConfig

    init(config: AppConfig) {
        self.config = config
    }

    func track(event: AnalyticsEvent, properties: EventProperties) {
        // Phase 1: wiring wrapper only. Real PostHog SDK calls are added behind this interface.
        let payload = properties.values.mapValues(\.self)
        print("[Analytics] event=\(event.rawValue) host=\(config.postHogHost) payload=\(payload)")
    }
}
