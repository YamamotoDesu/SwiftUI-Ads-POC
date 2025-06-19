import SwiftUI

extension UIApplication {
    static var rootController: UIViewController? {
        return UIApplication.shared
            .connectedScenes
            .compactMap { $0 as? UIWindowScene }
            .flatMap { $0.windows }
            .first { $0.isKeyWindow }?
            .rootViewController
    }
}

struct ContentView: View {
    @StateObject private var adViewModel = InterstitialViewModel()

    var body: some View {
        VStack(spacing: 20) {
            Text("Interstitial Ad Demo")
                .font(.title)
            Button("Show Interstitial Ad") {
                if let root = UIApplication.rootController, adViewModel.adLoaded {
                    adViewModel.showAd(from: root)
                }
            }
            .disabled(!adViewModel.adLoaded)
        }
        .onAppear {
            adViewModel.loadAd()
        }
        .padding()
    }
} 