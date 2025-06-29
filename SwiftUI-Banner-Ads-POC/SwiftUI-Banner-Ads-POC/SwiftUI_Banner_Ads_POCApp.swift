//
//  SwiftUI_Ads_POCApp.swift
//  SwiftUI-Banner-Ads-POC
//
//  Created by Anirban Deb on 11/6/25.
//

import SwiftUI
import GoogleMobileAds

@main
struct SwiftUI_Banner_Ads_POCApp: App {
    init() {
        MobileAds.shared.start(completionHandler: nil)
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }  
    }
}
