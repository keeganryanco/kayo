import Foundation

struct AppModel {
    let analyticsClient: any AnalyticsClient
    let paywallClient: any PaywallClient

    static func makeDefault() -> AppModel {
        let config = AppConfig.loadFromBundle()
        return AppModel(
            analyticsClient: PostHogAnalyticsClient(config: config),
            paywallClient: RevenueCatPaywallClient(config: config)
        )
    }
}
