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
                    Text("Knock out your screentime")
                        .font(.kayoDisplay(size: 62))
                        .foregroundStyle(Color.kayoNearBlack)
                        .lineSpacing(2)
                        .fixedSize(horizontal: false, vertical: true)

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

private struct KAYOHeroLogoView: View {
    var body: some View {
        GeometryReader { proxy in
            Text("KAYO")
                .font(.kayoDisplay(size: min(220, proxy.size.width * 0.44)))
                .foregroundStyle(Color.kayoNearBlack)
                .lineLimit(1)
                .minimumScaleFactor(0.7)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                .accessibilityLabel("KAYO logo")
        }
        .frame(height: 210)
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
