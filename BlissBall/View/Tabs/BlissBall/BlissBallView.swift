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
        }
      }
      .padding(.horizontal, 20)
      .navigationTitle("BlissBall")
    
    .onReceive(NotificationCenter.default.publisher(for: .deviceDidShakeNotification)) { _ in
      
    }
  }
}

#Preview {
  BlissBallView()
    .environmentObject(CustomBlissBallViewModel())
}
