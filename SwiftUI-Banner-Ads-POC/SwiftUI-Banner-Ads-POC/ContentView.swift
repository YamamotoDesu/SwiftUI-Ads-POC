//
//  ContentView.swift
//  SwiftUI-Banner-Ads-POC
//
//  Created by Anirban Deb on 11/6/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Your App Content")
                .padding()
            
            Spacer()
            
            BannerAdView()
                .frame(height: 50)
        }
    }
}

#Preview {
    ContentView()
}
