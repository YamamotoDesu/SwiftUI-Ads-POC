import SwiftUI
import GoogleMobileAds

class InterstitialAdManager: NSObject, ObservableObject {
    @Published var interstitial: InterstitialAd?
    
    override init() {
        super.init()
        loadInterstitial()
    }
    
    func loadInterstitial() {
        let request = Request()
        InterstitialAd.load(with: "ca-app-pub-3940256099942544/4411468910", request: request) { [weak self] ad, error in
            if let error = error {
                print("Failed to load interstitial ad with error: \(error.localizedDescription)")
                return
            }
            self?.interstitial = ad
        }
    }
    
    func showAd(from rootViewController: UIViewController) {
        if let interstitial = interstitial {
            interstitial.present(from: rootViewController)
        } else {
            print("Ad wasn't ready")
        }
    }
}

struct InterstitialAdView: UIViewControllerRepresentable {
    @ObservedObject var adManager: InterstitialAdManager
    
    func makeUIViewController(context: Context) -> UIViewController {
        let viewController = UIViewController()
        return viewController
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        adManager.showAd(from: uiViewController)
    }
} 
