# SwiftUI Ads POC

This project demonstrates the integration of Google Mobile Ads in a SwiftUI application.

## Setup Instructions

1. **Google Mobile Ads SDK**
   - The project uses Google Mobile Ads SDK via Swift Package Manager
   - Package URL: `https://github.com/googleads/swift-package-manager-google-mobile-ads.git`

2. **Ad Unit IDs**
   - Current implementation uses test ad unit IDs
   - Banner Ad Test ID: `ca-app-pub-3940256099942544/2934735716`
   - App ID: `ca-app-pub-3940256099942544~1458002511`

3. **Production Setup**
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