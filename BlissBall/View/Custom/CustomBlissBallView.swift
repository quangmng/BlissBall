//
//  CustomBlissBallView.swift
//  BlissBubble
//
//  Created by JungWoo Choi on 12/5/2024.
//

import SwiftUI

struct CustomBlissBallView: View {
  @EnvironmentObject var viewModel: CustomBlissBallViewModel
  
  var body: some View {
    ZStack {
      Circle()
        .frame(width: viewModel.extRadius, height: viewModel.extRadius)
        .shadow(color: .gray, radius: 20, x: -10, y: -10)
        .foregroundStyle(viewModel.extColor)
      
      ZStack() {
        Circle()
          .frame(width: viewModel.innerRadius, height: viewModel.innerRadius)
          .foregroundStyle(viewModel.innerColor)
          .offset(x: 10, y: 20)
        
        Text("8")
          .font(.system(size: 100))
          .fontWeight(.bold)
          .offset(x: 14, y: 24)
          .foregroundStyle(viewModel.textColor)
      }
    }
  }
}

#Preview {
  CustomBlissBallView()
    .environmentObject(CustomBlissBallViewModel())
}
