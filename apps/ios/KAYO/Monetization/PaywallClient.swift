import Foundation

enum EntitlementStatus: String {
    case active
    case inactive
    case unknown
}

protocol PaywallClient {
    func currentEntitlementStatus() -> EntitlementStatus
    func activePaywallVariant(experimentID: String?) -> String
}

final class RevenueCatPaywallClient: PaywallClient {
    private let config: AppConfig

    init(config: AppConfig) {
        self.config = config
    }

    func currentEntitlementStatus() -> EntitlementStatus {
        // Phase 1: SDK wiring wrapper only.
        guard !config.revenueCatAPIKey.isEmpty else {
            return .unknown
        }
        return .inactive
    }

    func activePaywallVariant(experimentID: String?) -> String {
        guard let experimentID, !experimentID.isEmpty else {
            return "control"
        }
        return "control_\(experimentID)"
    }
}
