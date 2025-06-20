# SwiftUI Interstitial ads POC

This project demonstrates the integration of Google Mobile Ads in a SwiftUI application.

Interstitial ads are full-screen ads that cover the interface of an app until closed by the user. They're typically displayed at natural transition points in the flow of an app, such as between activities or during the pause between levels in a game. When an app shows an interstitial ad, the user has the choice to either tap on the ad and continue to its destination or close it and return to the app.

## Setup Instructions

1. **Google Mobile Ads SDK**
   - The project uses Google Mobile Ads SDK via Swift Package Manager
   - Package URL: `https://github.com/googleads/swift-package-manager-google-mobile-ads.git`

2. **Ad Unit IDs**
   - Current implementation uses test ad unit IDs
   - Interstitial Ad Test ID: `ca-app-pub-3940256099942544/4411468910`
   - App ID: `ca-app-pub-3940256099942544~1458002511`

3. **Production Setup**
   - Replace test ad unit IDs with your actual AdMob ad unit IDs
   - Update the `GADApplicationIdentifier` in Info.plist with your actual AdMob app ID
   - Ensure you have an active AdMob account

## Implementation Details

- Interstitial ads are implemented using `InterstitialAdView` and `InterstitialAdManager`
- Ads are initialized in `SwiftUI_Ads_POCApp`
- Interstitial ads are shown when the user taps the "Show Interstitial Ad" button



## Project Creation & Usage

### How this project was created

This project was created as a minimal SwiftUI example for Google AdMob Interstitial Ads, following the official guide: https://developers.google.com/admob/ios/interstitial

- The project uses Swift Package Manager to add the Google Mobile Ads SDK.
- The main files are:
  - `ContentView.swift`: The main SwiftUI view.
  - `InterstitialViewModel.swift`: Handles loading and showing interstitial ads.
  - `SwiftUI_Ads_POCApp.swift`: The app entry point, initializes GoogleMobileAds.
  - `Info.plist`: Contains the AdMob App ID and other configuration.
  - `Assets.xcassets`: App icons and color assets.

### File Descriptions

- **ContentView.swift**: The main SwiftUI view of the app. It provides the user interface, including a button to show an interstitial ad. It uses the InterstitialViewModel to manage ad loading and presentation.

- **InterstitialAdView.swift**: (If present) An alternative or legacy implementation for displaying interstitial ads. You may use this for reference or for custom ad presentation logic. In the minimal setup, this file is not strictly required, but may be included for experimentation or comparison.

- **InterstitialViewModel.swift**: Contains the logic for loading, presenting, and reloading interstitial ads using the Google Mobile Ads SDK. It is an ObservableObject, so it can be used with SwiftUI's data flow. Handles ad lifecycle and delegates.

- **SwiftUI_Ads_POCApp.swift**: The entry point of the SwiftUI app (annotated with @main). It initializes the Google Mobile Ads SDK and sets ContentView as the root view.

- **Info.plist**: The property list file for app configuration. It includes the AdMob App ID (GADApplicationIdentifier) and other required settings for the app to run and for AdMob to function.

- **Assets.xcassets**: Contains image and color assets for the app, such as the app icon and accent color. Required for a complete Xcode project.


### How to open this project in Xcode 

1. Open Xcode.
2. Select "Open a project or file".
3. Navigate to this folder and select `SwiftUI-Ads-POC.xcodeproj`.
4. Build and run the project on a simulator or device.

### What to do if SwiftUI-Ads-POC.xcodeproj is missing

If you do not have the `SwiftUI-Ads-POC.xcodeproj` file (the Xcode project file), you can create a new Xcode project and add the existing source files as follows:

1. **Open Xcode** and select "Create a new Xcode project".
2. Choose **App** under the iOS tab and click **Next**.
3. Enter the product name (e.g., `SwiftUI-Ads-POC`), select **Swift** as the language, and **SwiftUI** as the interface. Click **Next**.
4. Choose the folder where your existing files are located and click **Create**.
5. In the Xcode project navigator, right-click on the project group (usually named after your project) and select **Add Files to "SwiftUI-Ads-POC"...**
6. Select all your existing Swift files (`ContentView.swift`, `InterstitialViewModel.swift`, `SwiftUI_Ads_POCApp.swift`, etc.), `Info.plist`, and the `Assets.xcassets` folder, then click **Add**.
7. Make sure all files are added to the correct target (check the Target Membership in the File Inspector for each file).
8. Add the Google Mobile Ads SDK via Swift Package Manager (File > Add Packages... and use `https://github.com/googleads/swift-package-manager-google-mobile-ads.git`).
9. Build and run the project.

This will recreate the Xcode project and allow you to use your existing source files.

### Folder Structure

```
SwiftUI-Ads-POC/
├── Assets.xcassets/
│   ├── AccentColor.colorset/
│   │   └── Contents.json
│   ├── AppIcon.appiconset/
│   │   └── Contents.json
│   ├── Contents.json
│   └── .DS_Store
├── ContentView.swift
├── InterstitialAdView.swift
├── InterstitialViewModel.swift
├── Info.plist
├── README.md
├── SwiftUI_Ads_POCApp.swift
└── SwiftUI-Ads-POC.xcodeproj/
```

For more details, see the [official AdMob iOS interstitial guide](https://developers.google.com/admob/ios/interstitial).

## References

- [Google AdMob iOS Interstitial Guide](https://developers.google.com/admob/ios/interstitial)
- [Google Mobile Ads SDK for iOS (Swift Package Manager)](https://github.com/googleads/swift-package-manager-google-mobile-ads)
- Apple Developer Documentation: [SwiftUI](https://developer.apple.com/documentation/swiftui), [UIApplication](https://developer.apple.com/documentation/uikit/uiapplication)

All implementation and setup steps in this project are based on the official AdMob documentation and best practices from Apple and Google. 