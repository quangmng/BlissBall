//
//  BlissBallView.swift
//  BlissBubble
//
//  Created by JungWoo Choi on 3/5/2024.
//

import SwiftUI

struct BlissBallView: View {
  @EnvironmentObject var customBlissBallViewModel: CustomBlissBallViewModel
    var body: some View {
        NavigationStack {
            VStack {
              CustomBlissBallView()
                .environmentObject(customBlissBallViewModel)
              .padding(.bottom, 16)
            
              Text("Shake phone or tab ball to activate")
                  .font(.title)
            }
          
            .navigationTitle("BlissBall")
        }
    }
}

#Preview {
    BlissBallView()
    .environmentObject(CustomBlissBallViewModel())
}
