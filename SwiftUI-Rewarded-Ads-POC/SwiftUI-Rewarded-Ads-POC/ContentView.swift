//
//  ContentView.swift
//  SwiftUI-Rewarded-Ads-POC
//
//  Created by Anirban Deb on 11/6/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            RewardedAdContentView()
                .navigationTitle("AdMob Rewarded Ads")
                .navigationBarTitleDisplayMode(.large)
        }
    }
}

#Preview {
    ContentView()
}
