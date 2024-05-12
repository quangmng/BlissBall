//
//  CustomColorPickerView.swift
//  BlissBubble
//
//  Created by JungWoo Choi on 12/5/2024.
//

import SwiftUI

var sampleColorList: [Color] = [
  .black,
  .red,
  .green,
  .yellow,
  .blue,
  .brown
]

struct CustomColorPickerView: View {
  @EnvironmentObject var viewModel: CustomBlissBallViewModel
  
  var title: String = "EXTERIOR"
  var colorList = sampleColorList
  
  
  var body: some View {
    VStack(alignment: .leading) {
      HStack {
        Text(title)
        
        Spacer()
      }
      
      ScrollView(.horizontal) {
        HStack(spacing: 24) {
          ForEach(colorList, id: \.self) { color in
            Button {
              viewModel.extColor = color
            } label: {
              Rectangle()
                .fill(color)
                .frame(width: 48, height: 48)
                .clipShape(.buttonBorder)
            }
          }
        }
      }
      .scrollIndicators(.hidden)
    }
    .padding([.horizontal, .bottom], 20)
  }
}

#Preview {
    CustomColorPickerView()
    .environmentObject(CustomBlissBallViewModel())
}
