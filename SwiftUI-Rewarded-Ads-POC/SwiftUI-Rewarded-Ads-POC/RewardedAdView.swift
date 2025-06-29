import SwiftUI

struct RewardedAdContentView: View {
    @StateObject private var viewModel = RewardedViewModel()
    @State private var showWatchVideoButton = true
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Coins: \(viewModel.coins)")
                .font(.title)
                .fontWeight(.bold)
            
            if showWatchVideoButton {
                Button("Watch video for additional 10 coins") {
                    viewModel.showAd()
                    showWatchVideoButton = false
                }
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(10)
                .disabled(viewModel.isLoading)
            }
            
            if viewModel.isLoading {
                ProgressView("Loading Ad...")
                    .padding()
            }
            
            Spacer()
        }
        .padding()
        .onAppear {
            if !viewModel.isAdReady {
                viewModel.loadAd()
            }
        }
    }
}

#Preview {
    RewardedAdContentView()
} 