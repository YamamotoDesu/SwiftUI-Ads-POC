# SwiftUI Banner Ads POC

This project demonstrates the integration of Google Mobile Ads in a SwiftUI application.

## Full Project GitHub Link

For full content Please follow this branch: [https://github.com/YamamotoDesu/SwiftUI-Ads-POC/tree/banner-branch-swiftui-ads-v1](https://github.com/YamamotoDesu/SwiftUI-Ads-POC/tree/banner-branch-swiftui-ads-v1)

## Project Structure

The project consists of the following main files:

1. **SwiftUI_Ads_POCApp.swift**
   - Main app entry point
   - Initializes Google Mobile Ads SDK
   - Sets up the main window and content view

2. **ContentView.swift**
   - Main view of the application
   - Contains the app's primary content
   - Integrates the banner ad at the bottom of the screen

3. **BannerAdView.swift**
   - Custom SwiftUI view for displaying banner ads
   - Implements UIViewControllerRepresentable for Google Mobile Ads
   - Handles banner ad initialization and display
   - Uses test ad unit ID by default

## Folder Structure

```
SwiftUI-Ads-POC/
├── SwiftUI-Ads-POC/
│   ├── Assets.xcassets/
│   │   ├── AccentColor.colorset/
│   │   │   └── Contents.json
│   │   ├── AppIcon.appiconset/
│   │   │   └── Contents.json
│   │   └── Contents.json
│   ├── BannerAdView.swift
│   ├── ContentView.swift
│   ├── Info.plist
│   ├── README.md
│   └── SwiftUI_Ads_POCApp.swift
├── .gitignore
└── README.md
```

### File Descriptions:
- **`SwiftUI_Ads_POCApp.swift`**: Main application entry point with Google Mobile Ads initialization
- **`ContentView.swift`**: Primary SwiftUI view containing the app's main content and banner ad integration
- **`BannerAdView.swift`**: Custom SwiftUI wrapper for Google Mobile Ads banner implementation
- **`Info.plist`**: Configuration file with Google Mobile Ads settings and permissions
- **`Assets.xcassets/`**: Xcode asset catalog containing app icons and colors
- **`README.md`**: This documentation file

## Creating the Xcode Project

Since this repository contains only the source files without the Xcode project file, follow these steps to create and set up the project in Xcode:

### Step 1: Create a New Xcode Project
1. Open Xcode
2. Click **"Create a new Xcode project"**
3. Choose **"iOS"** tab
4. Select **"App"** under Application
5. Click **"Next"**

### Step 2: Configure the Project
1. **Product Name**: `SwiftUI-Ads-POC`
2. **Team**: Select your development team
3. **Organization Identifier**: Use your bundle identifier (e.g., `com.yourname`)
4. **Interface**: Select **"SwiftUI"**
5. **Language**: Select **"Swift"**
6. **Use Core Data**: Uncheck
7. **Include Tests**: Uncheck
8. Click **"Next"**

### Step 3: Save the Project
1. Choose the location: `/Users/anirban/Desktop/SwiftUI-Ads-POC` (or your preferred location)
2. Click **"Create"**

### Step 4: Replace Generated Files
Once the project is created, replace the generated files with the existing ones:

1. **Replace `SwiftUI_Ads_POCApp.swift`** with the existing one from this repository
2. **Replace `ContentView.swift`** with the existing one from this repository
3. **Add `BannerAdView.swift`** to the project:
   - Right-click on your project in the navigator
   - Select **"Add Files to [ProjectName]"**
   - Navigate to and select `BannerAdView.swift`
   - Click **"Add"**

### Step 5: Update Info.plist
1. Open the existing `Info.plist` file from this repository
2. Copy its contents
3. Replace the contents of the generated `Info.plist` in your Xcode project with the copied content

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
