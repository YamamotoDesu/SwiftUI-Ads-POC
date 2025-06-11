//
//  ContentView.swift
//  SwiftUI-Ads-POC
//
//  Created by Anirban Deb on 11/6/25.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var adManager = InterstitialAdManager()
    
    var body: some View {
        VStack {
            Text("Your App Content")
                .padding()
            
            Button("Show Interstitial Ad") {
                if adManager.interstitial != nil {
                    adManager.showAd(from: UIApplication.shared.windows.first?.rootViewController ?? UIViewController())
                } else {
                    adManager.loadInterstitial()
                }
            }
            .padding()
            .disabled(adManager.isLoading)
            
            if adManager.isLoading {
                ProgressView("Loading Ad...")
            }
        }
    }
}

#Preview {
    ContentView()
}
