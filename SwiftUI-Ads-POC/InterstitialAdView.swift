import SwiftUI
import GoogleMobileAds

class InterstitialAdManager: NSObject, ObservableObject {
    @Published var interstitial: InterstitialAd?
    @Published var isLoading = false
    
    override init() {
        super.init()
        DispatchQueue.main.async { [weak self] in
            self?.loadInterstitial()
        }
    }
    
    func loadInterstitial() {
        guard !isLoading else { return }
        
        DispatchQueue.main.async { [weak self] in
            self?.isLoading = true
        }
        
        let request = Request()
        InterstitialAd.load(with: "ca-app-pub-3940256099942544/4411468910", request: request) { [weak self] ad, error in
            DispatchQueue.main.async {
                self?.isLoading = false
                if let error = error {
                    print("Failed to load interstitial ad with error: \(error.localizedDescription)")
                    return
                }
                self?.interstitial = ad
                print("Ad loaded successfully")
            }
        }
    }
    
    func showAd(from rootViewController: UIViewController) {
        guard let interstitial = interstitial else {
            print("Ad wasn't ready")
            loadInterstitial()
            return
        }
        
        // Set up the delegate to handle ad dismissal
        interstitial.fullScreenContentDelegate = self
        
        // Present the ad
        interstitial.present(from: rootViewController)
        
        // Clear the current ad
        self.interstitial = nil
        
        // Load the next ad
        loadInterstitial()
    }
}

// MARK: - GADFullScreenContentDelegate
extension InterstitialAdManager: FullScreenContentDelegate {
    func adDidDismissFullScreenContent(_ ad: FullScreenPresentingAd) {
        print("Ad dismissed")
        loadInterstitial()
    }
    
    func ad(_ ad: FullScreenPresentingAd, didFailToPresentFullScreenContentWithError error: Error) {
        print("Ad failed to present with error: \(error.localizedDescription)")
        loadInterstitial()
    }
    
    func adWillPresentFullScreenContent(_ ad: FullScreenPresentingAd) {
        print("Ad will present")
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
