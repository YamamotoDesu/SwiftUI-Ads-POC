import SwiftUI
import GoogleMobileAds

@MainActor
class RewardedViewModel: NSObject, ObservableObject, FullScreenContentDelegate {
    @Published var coins = 0
    @Published var isLoading = false
    private var rewardedAd: RewardedAd?
    
    var isAdReady: Bool {
        return rewardedAd != nil
    }
    
    override init() {
        super.init()
        loadAd()
    }
    
    func loadAd() async {
        DispatchQueue.main.async { [weak self] in
            self?.isLoading = true
        }
        
        do {
            rewardedAd = try await RewardedAd.load(
                with: "ca-app-pub-3940256099942544/1712485313", request: Request())
            
            let options = ServerSideVerificationOptions()
            options.customRewardText = "SAMPLE_CUSTOM_DATA_STRING"
            rewardedAd?.serverSideVerificationOptions = options
            
            rewardedAd?.fullScreenContentDelegate = self
            
            DispatchQueue.main.async { [weak self] in
                self?.isLoading = false
            }
            print("Rewarded ad loaded successfully")
        } catch {
            DispatchQueue.main.async { [weak self] in
                self?.isLoading = false
            }
            print("Failed to load rewarded ad with error: \(error.localizedDescription)")
        }
    }
    
    func loadAd() {
        Task {
            await loadAd()
        }
    }
    
    func showAd() {
        guard let rewardedAd = rewardedAd else {
            print("Ad wasn't ready.")
            loadAd()
            return
        }
        
        rewardedAd.present(from: nil) { [weak self] in
            let reward = rewardedAd.adReward
            print("Reward amount: \(reward.amount)")
            DispatchQueue.main.async {
                self?.addCoins(reward.amount.intValue)
            }
        }
    }
    
    func addCoins(_ amount: Int) {
        coins += amount
    }
    
    // MARK: - FullScreenContentDelegate
    
    func adDidDismissFullScreenContent(_ ad: FullScreenPresentingAd) {
        print("Ad did dismiss full screen content.")
        loadAd()
    }
    
    func ad(_ ad: FullScreenPresentingAd, didFailToPresentFullScreenContentWithError error: Error) {
        print("Ad did fail to present full screen content with error: \(error.localizedDescription)")
        loadAd()
    }
    
    func adWillPresentFullScreenContent(_ ad: FullScreenPresentingAd) {
        print("Ad will present full screen content.")
    }
} 
