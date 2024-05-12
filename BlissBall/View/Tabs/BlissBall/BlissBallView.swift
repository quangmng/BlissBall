//
//  BlissBallView.swift
//  BlissBubble
//
//  Created by JungWoo Choi on 3/5/2024.
//

import SwiftUI

struct BlissBallView: View {
  @EnvironmentObject var customBlissBallViewModel: CustomBlissBallViewModel
  
  @State private var isAppear = false
  
  var body: some View {
    NavigationStack {
      VStack {
        Button {
          isAppear.toggle()
        } label: {
          CustomBlissBallView()
            .environmentObject(customBlissBallViewModel)
        }
        .padding(.bottom, 16)
        
        if isAppear {
          
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
      isAppear = true
    }
  }
}

#Preview {
  BlissBallView()
    .environmentObject(CustomBlissBallViewModel())
}
