import SwiftUI

struct HomeView: View {
    let analyticsClient: any AnalyticsClient
    let paywallClient: any PaywallClient

    @State private var showsOnboarding = false

    var body: some View {
        ZStack {
            Color.kayoGold.ignoresSafeArea()

            VStack(spacing: 0) {
                Spacer(minLength: 0)

                KAYOHeroLogoView()
                    .padding(.horizontal, 20)

                Spacer(minLength: 12)

                VStack(alignment: .leading, spacing: 18) {
                    KAYOBlockHeadlineView()

                    Text("Reclaim 100 days a year for the work that actually matters")
                        .font(.kayoBody(size: 16))
                        .foregroundStyle(Color.kayoNearBlack)
                        .fixedSize(horizontal: false, vertical: true)

                    Button("Get Started") {
                        analyticsClient.track(
                            event: .onboardingStarted,
                            properties: EventProperties(values: [
                                .screenName: "home",
                                .source: "home_get_started_cta"
                            ])
                        )
                        showsOnboarding = true
                    }
                    .buttonStyle(KAYOPrimaryButtonStyle())
                }
                .padding(.horizontal, 24)
                .padding(.bottom, 24)
            }
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

private struct KAYOBlockHeadlineView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: -14) {
            Text("Knock out your")
            Text("screentime")
        }
        .font(.kayoDisplay(size: 54))
        .foregroundStyle(Color.kayoNearBlack)
        .fixedSize(horizontal: false, vertical: true)
    }
}

private struct KAYOHeroLogoView: View {
    var body: some View {
        Image("KAYOHeroLogo")
            .resizable()
            .renderingMode(.original)
            .scaledToFit()
            .frame(maxWidth: .infinity)
            .frame(height: 360)
            .accessibilityLabel("KAYO logo")
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
