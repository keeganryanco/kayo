import SwiftUI

@main
struct KAYOApp: App {
    private let appModel = AppModel.makeDefault()

    var body: some Scene {
        WindowGroup {
            HomeView(
                analyticsClient: appModel.analyticsClient,
                paywallClient: appModel.paywallClient
            )
        }
    }
}
