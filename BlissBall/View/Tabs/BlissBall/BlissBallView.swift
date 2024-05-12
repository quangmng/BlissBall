//
//  BlissBallView.swift
//  BlissBubble
//
//  Created by JungWoo Choi on 3/5/2024.
//

import SwiftUI

struct BlissBallView: View {
  @EnvironmentObject var customBlissBallViewModel: CustomBlissBallViewModel
  @StateObject var viewModel = BlissBallViewModel()
  
  @State private var isAppear = false
  
  var body: some View {
    NavigationStack {
      VStack {
        Button {
            viewModel.fetchData()
            isAppear = true
        } label: {
          CustomBlissBallView()
            .environmentObject(customBlissBallViewModel)
        }
        .padding(.bottom, 16)
        
        if isAppear {
          VStack {
            Text(viewModel.quoteData?.quote ?? "Do something to move yourself toward your major goal every day.")
              .font(.system(size: 16))
              .fontWeight(.semibold)
            Text(viewModel.quoteData?.author ?? "")
          }
        } else {
          Text("Shake phone or tap the ball to activate!")
            .font(.system(size: 24))
            .fontWeight(.semibold)
        }
      }
      .padding(.horizontal, 20)
      .navigationTitle("BlissBall")
    }
    .onReceive(NotificationCenter.default.publisher(for: .deviceDidShakeNotification)) { _ in
      viewModel.fetchData()
      isAppear = true
    }
  }
}

#Preview {
  BlissBallView()
    .environmentObject(CustomBlissBallViewModel())
}
