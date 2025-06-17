# SwiftUI Ads POC

This project demonstrates the integration of Google Mobile Ads in a SwiftUI application.

## Setup Instructions

1. **Google Mobile Ads SDK Setup in Xcode**
   - Open the project in Xcode
   - Go to File > Add Packages
   - In the search bar at the top right, paste: `https://github.com/googleads/swift-package-manager-google-mobile-ads.git`
   - Click "Add Package"
   - Select your target and click "Add Package" again
   - Wait for the package to be downloaded and integrated

2. **Configure Info.plist in Xcode**
   - Click on your project in the navigator (blue project icon)
   - Select your target
   - Click the "Info" tab
   - Look for "Custom iOS Target Properties"
   - Click the "+" button to add new entries
   - Add the following keys:
     - Key: `GADApplicationIdentifier`
       - Type: String
       - Value: `ca-app-pub-3940256099942544~1458002511`
     - Key: `SKAdNetworkItems`
       - Type: Array
       - Add an item (Dictionary) with:
         - Key: `SKAdNetworkIdentifier`
         - Type: String
         - Value: `cstr6suwn9.skadnetwork`

3. **Ad Unit IDs**
   - Current implementation uses test ad unit IDs
   - Banner Ad Test ID: `ca-app-pub-3940256099942544/2934735716`
   - App ID: `ca-app-pub-3940256099942544~1458002511`

4. **Production Setup**
   - Replace test ad unit IDs with your actual AdMob ad unit IDs
   - Update the `GADApplicationIdentifier` in Info.plist with your actual AdMob app ID
   - Ensure you have an active AdMob account

## Implementation Details

- Banner ads are implemented using `BannerAdView`
- Ads are initialized in `SwiftUI_Ads_POCApp`
- Banner ad is displayed at the bottom of the main content view

## Testing

- Use test ad unit IDs during development
- Test on both simulator and real devices
- Verify ad loading and display
- Check for any console warnings or errors 