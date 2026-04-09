import SwiftUI

struct OnboardingView: View {
    let analyticsClient: any AnalyticsClient
    let paywallClient: any PaywallClient

    @Environment(\.dismiss) private var dismiss

    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: 16) {
                Text("Welcome to KAYO")
                    .font(.kayoDisplay(size: 42))

                Text("Onboarding and experiments will be driven by PostHog variants in phase two.")
                    .font(.kayoBody(size: 17))

                Button("Check subscription status") {
                    let status = paywallClient.currentEntitlementStatus()
                    analyticsClient.track(
                        event: .subscriptionStatusChecked,
                        properties: EventProperties(values: [
                            .screenName: "onboarding",
                            .source: status.rawValue
                        ])
                    )
                }
                .buttonStyle(.borderedProminent)

                Spacer()
            }
            .padding(24)
            .navigationTitle("Onboarding")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Done") { dismiss() }
                }
            }
        }
    }
}
