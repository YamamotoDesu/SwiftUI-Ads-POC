import Foundation
import GoogleMobileAds

class InterstitialViewModel: NSObject, ObservableObject, FullScreenContentDelegate {
    private var interstitialAd: InterstitialAd?
    @Published var adLoaded = false

    func loadAd() {
        let request = Request()
        InterstitialAd.load(with: "ca-app-pub-3940256099942544/4411468910", request: request) { [weak self] ad, error in
            if let error = error {
                print("Failed to load interstitial ad: \(error.localizedDescription)")
                self?.adLoaded = false
                return
            }
            self?.interstitialAd = ad
            self?.interstitialAd?.fullScreenContentDelegate = self
            self?.adLoaded = true
        }
    }

    func showAd(from root: UIViewController) {
        guard let ad = interstitialAd else {
            print("Ad wasn't ready")
            return
        }
        ad.present(from: root)
    }

    func adDidDismissFullScreenContent(_ ad: FullScreenPresentingAd) {
        interstitialAd = nil
        adLoaded = false
        loadAd()
    }
} 
