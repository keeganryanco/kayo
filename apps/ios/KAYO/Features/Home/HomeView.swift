import SwiftUI

struct HomeView: View {
    let analyticsClient: any AnalyticsClient
    let paywallClient: any PaywallClient

    @State private var showsOnboarding = false

    var body: some View {
        ZStack {
            Color.kayoGold.ignoresSafeArea()

            VStack(alignment: .leading, spacing: 20) {
                Text("KAYO")
                    .font(.system(size: 56, weight: .medium, design: .default))
                    .tracking(0.6)
                    .foregroundStyle(Color.kayoNearBlack)

                Text("Knock out your screen time.")
                    .font(.kayoDisplay(size: 54))
                    .foregroundStyle(Color.kayoNearBlack)
                    .lineSpacing(2)

                Text("A focused screen-time app for founders and builders in grind mode.")
                    .font(.kayoBody(size: 18))
                    .foregroundStyle(Color.kayoNearBlack)
                    .fixedSize(horizontal: false, vertical: true)

                Button("Start onboarding") {
                    analyticsClient.track(
                        event: .onboardingStarted,
                        properties: EventProperties(values: [
                            .screenName: "home",
                            .source: "home_primary_cta"
                        ])
                    )
                    showsOnboarding = true
                }
                .buttonStyle(KAYOPrimaryButtonStyle())
            }
            .padding(24)
        }
        .sheet(isPresented: $showsOnboarding) {
            OnboardingView(
                analyticsClient: analyticsClient,
                paywallClient: paywallClient
            )
        }
        .onAppear {
            analyticsClient.track(event: .appOpened, properties: .empty)
        }
    }
}

private struct KAYOPrimaryButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.kayoBody(size: 16).weight(.semibold))
            .foregroundStyle(Color.kayoGold)
            .padding(.vertical, 14)
            .padding(.horizontal, 16)
            .frame(maxWidth: .infinity)
            .background(Color.kayoNearBlack)
            .opacity(configuration.isPressed ? 0.85 : 1)
    }
}
