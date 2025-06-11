//
//  ContentView.swift
//  SwiftUI-Ads-POC
//
//  Created by Anirban Deb on 11/6/25.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var adManager = InterstitialAdManager()
    @State private var showAd = false
    
    var body: some View {
        VStack {
            Text("Your App Content")
                .padding()
            
            Button("Show Interstitial Ad") {
                showAd = true
            }
            .padding()
        }
        .sheet(isPresented: $showAd) {
            InterstitialAdView(adManager: adManager)
        }
    }
}

#Preview {
    ContentView()
}
