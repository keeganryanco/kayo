import Foundation

struct AppConfig {
    let postHogAPIKey: String
    let postHogHost: String
    let revenueCatAPIKey: String
    let revenueCatEntitlementID: String

    static func loadFromBundle(bundle: Bundle = .main) -> AppConfig {
        AppConfig(
            postHogAPIKey: bundle.object(forInfoDictionaryKey: "POSTHOG_API_KEY") as? String ?? "",
            postHogHost: bundle.object(forInfoDictionaryKey: "POSTHOG_HOST") as? String ?? "",
            revenueCatAPIKey: bundle.object(forInfoDictionaryKey: "REVENUECAT_API_KEY") as? String ?? "",
            revenueCatEntitlementID: bundle.object(forInfoDictionaryKey: "REVENUECAT_ENTITLEMENT_ID") as? String ?? "pro"
        )
    }
}
