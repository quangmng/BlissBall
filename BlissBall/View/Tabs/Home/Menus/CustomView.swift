//
//  CustomView.swift
//  BlissBubble
//
//  Created by JungWoo Choi on 3/5/2024.
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

struct CustomView: View {
  @EnvironmentObject var viewModel: CustomBlissBallViewModel
  
  var colorList = sampleColorList
  
  var body: some View {
    NavigationStack{
      VStack {
        CustomBlissBallView()
          .environmentObject(viewModel)
        
        VStack(alignment: .leading) {
          HStack {
            Text("exterior".uppercased())
            
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
          
        VStack(alignment: .leading) {
          HStack {
            Text("CENTRE \"8\"".uppercased())
            
            Spacer()
          }
          
          ScrollView(.horizontal) {
            HStack(spacing: 24) {
              ForEach(colorList, id: \.self) { color in
                Button {
                  viewModel.textColor = color
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
        
        VStack(alignment: .leading) {
          HStack {
            Text("filling".uppercased())
            
            Spacer()
          }
          
          ScrollView(.horizontal) {
            HStack(spacing: 24) {
              ForEach(colorList, id: \.self) { color in
                Button {
                  viewModel.innerColor = color
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
      .navigationTitle("Customise your ball")
    }
  }
}

#Preview {
  CustomView()
    .environmentObject(CustomBlissBallViewModel())
}
