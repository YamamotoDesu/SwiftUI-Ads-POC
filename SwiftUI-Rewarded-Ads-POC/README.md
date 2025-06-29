# SwiftUI Rewarded Ads POC

This project demonstrates how to integrate Google AdMob rewarded ads into a SwiftUI iOS application. The implementation follows the official Google AdMob documentation and best practices, using modern SwiftUI and MVVM patterns. It is ideal for developers looking to add rewarded ad monetization to their SwiftUI apps.

## Features

- ✅ SwiftUI integration with AdMob rewarded ads
- ✅ Async/await pattern for ad loading
- ✅ Proper delegate handling for ad lifecycle events
- ✅ Test ad unit IDs for development
- ✅ Coin reward system demonstration
- ✅ Loading states and user feedback
- ✅ Automatic ad reloading after dismissal
- ✅ Proper encapsulation with public APIs

## Prerequisites

- iOS 14.0+
- Xcode 14.0+
- Google Mobile Ads SDK 8.0.0 or higher
- SwiftUI knowledge

## Project Structure

```
SwiftUI-Rewarded-Ads-POC/
├── Assets.xcassets/                  # App assets
├── ContentView.swift                 # Root view with navigation
├── RewardedAdView.swift              # SwiftUI view for rewarded ads
├── RewardedViewModel.swift           # ViewModel for ad management
├── SwiftUI_Rewarded_Ads_POCApp.swift # Main app entry point
├── Info.plist                        # App configuration & permissions
├── README.md                         # Project documentation
└── ...
```

### Key Files Description

- **SwiftUI_Rewarded_Ads_POCApp.swift**: App initialization with AdMob SDK setup
- **ContentView.swift**: Main navigation container
- **RewardedAdView.swift**: SwiftUI view for the rewarded ads interface
- **RewardedViewModel.swift**: MVVM ViewModel handling all ad logic
- **Info.plist**: Contains AdMob app ID, SKAdNetworkItems, and tracking permissions

## Setup

### 1. Dependencies

The project uses Swift Package Manager to include the Google Mobile Ads SDK. The dependency is already configured in the Xcode project.

### 2. Configuration

#### Info.plist Configuration

The `Info.plist` file contains all necessary configurations:

- **GADApplicationIdentifier**: Your AdMob app ID (currently using test ID)
- **SKAdNetworkItems**: Required for iOS 14+ ad attribution
- **NSUserTrackingUsageDescription**: Required for iOS 14.5+ tracking permission

#### Test Ad Unit IDs

The project uses Google's official test ad unit IDs:

- **Rewarded Ad**: `ca-app-pub-3940256099942544/1712485313`
- **App ID**: `ca-app-pub-3940256099942544~1458002511`

**Important**: Always use test ad unit IDs during development to avoid account suspension.

## Implementation Details

### RewardedViewModel

The `RewardedViewModel` class handles all ad-related operations with proper encapsulation:

```swift
class RewardedViewModel: NSObject, ObservableObject, FullScreenContentDelegate {
    @Published var coins = 0
    @Published var isLoading = false
    private var rewardedAd: RewardedAd?
    
    // Public computed property to check if ad is ready
    var isAdReady: Bool {
        return rewardedAd != nil
    }
}
```

#### Key Properties

- `coins`: Published property for tracking user's coin balance
- `isLoading`: Published property for loading state management
- `isAdReady`: Computed property to check if ad is loaded (public API)

#### Key Methods

- `loadAd()`: Loads a rewarded ad using async/await pattern
- `showAd()`: Presents the ad and handles reward distribution
- `addCoins(_:)`: Updates the user's coin balance

#### Delegate Methods

- `adDidDismissFullScreenContent(_:)`: Called when ad is dismissed
- `ad(_:didFailToPresentFullScreenContentWithError:)`: Called on presentation failure
- `adWillPresentFullScreenContent(_:)`: Called before ad presentation

### RewardedAdContentView

The main SwiftUI view that provides the user interface:

- Displays current coin balance
- Shows/hides the "Watch Video" button based on ad availability
- Provides loading indicator during ad loading
- Handles user interaction for ad viewing
- Uses `isAdReady` property for proper encapsulation

## Usage

1. **Build and Run**: Open the project in Xcode and run on a device or simulator
2. **Watch Ad**: Tap the "Watch video for additional 10 coins" button
3. **Earn Rewards**: Complete the ad to receive coins
4. **Automatic Reload**: New ads are automatically loaded after each viewing

## Best Practices

### 1. Always Test with Test Ads

```swift
// Use test ad unit ID during development
let testAdUnitID = "ca-app-pub-3940256099942544/1712485313"
```

### 2. Handle Ad Lifecycle

```swift
// Reload ad after dismissal
func adDidDismissFullScreenContent(_ ad: FullScreenPresentingAd) {
    loadAd()
}
```

### 3. Proper Encapsulation

```swift
// Use public API instead of accessing private properties
if !viewModel.isAdReady {
    viewModel.loadAd()
}
```

### 4. User Consent

The app includes proper user tracking permission request for iOS 14.5+.

### 5. Error Handling

```swift
do {
    rewardedAd = try await RewardedAd.load(with: adUnitID, request: Request())
} catch {
    print("Failed to load rewarded ad: \(error.localizedDescription)")
}
```

## Production Deployment

Before publishing to the App Store:

1. Replace test ad unit IDs with your production IDs
2. Update the `GADApplicationIdentifier` in Info.plist
3. Test thoroughly with real ad units
4. Ensure compliance with App Store guidelines

## Troubleshooting

### Common Issues

1. **Ad Not Loading**: Check network connectivity and ad unit ID
2. **Delegate Not Called**: Ensure proper delegate assignment
3. **Build Errors**: Verify Google Mobile Ads SDK is properly linked
4. **Access Level Errors**: Use public APIs like `isAdReady` instead of accessing private properties



## Resources

- [Google AdMob iOS Documentation](https://developers.google.com/admob/ios/rewarded)
- [Mobile Ads SDK Reference](https://developers.google.com/admob/ios/api-reference)
- [Test Ad Unit IDs](https://developers.google.com/admob/ios/test-ads)

## License

This project is for educational purposes. Follow Google AdMob's terms of service for production use. 