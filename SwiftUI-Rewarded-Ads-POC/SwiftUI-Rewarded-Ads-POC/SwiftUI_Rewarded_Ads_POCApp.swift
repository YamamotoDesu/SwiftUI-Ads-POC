//
//  SwiftUI_Rewarded_Ads_POCApp.swift
//  SwiftUI-Rewarded-Ads-POC
//
//  Created by Anirban Deb on 11/6/25.
//

import SwiftUI
import GoogleMobileAds

@main
struct SwiftUI_Rewarded_Ads_POCApp: App {
    init() {
        MobileAds.shared.start { status in
            print("Google Mobile Ads SDK initialization completed with status: \(status)")
        }
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }  
    }
}

