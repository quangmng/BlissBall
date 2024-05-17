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
  @State private var interactBall = false
  var body: some View {
      NavigationStack {
          VStack {
              Button {
                  
              } label: {
                  CustomBlissBallView()
                      .environmentObject(customBlissBallViewModel)
              }
              .padding(.bottom, 16)
              
              Text("Shake phone or tap the ball to activate!")
                  .font(.system(size: 24))
                  .fontWeight(.semibold)
                  .padding(.horizontal, 25)
          }
          .navigationTitle("BlissBall")
          .navigationBarTitleDisplayMode(.large)
      }
    .onReceive(NotificationCenter.default.publisher(for: .deviceDidShakeNotification)) { _ in
      interactBall = true
    }
      
  }
    
}

#Preview {
  BlissBallView()
    .environmentObject(CustomBlissBallViewModel())
}
