//
//  CustomView.swift
//  BlissBubble
//
//  Created by JungWoo Choi on 3/5/2024.
//

import SwiftUI

var sampleColorList: [Color] = [
  .black,
  .white,
  .red,
  .pink,
  .purple,
  .green,
  .yellow,
  .blue,
  .teal,
  .cyan,
  .brown,
  .orange,
  
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
                  .opacity(0.5)
            Spacer()
          }
          
          ScrollView(.horizontal) {
            HStack(spacing: 24) {
              ForEach(colorList, id: \.self) { colour in
                Button {
                  viewModel.extColor = colour
                } label: {
                  Rectangle()
                    
                    .fill(colour)
                    .strokeBorder(.gray, lineWidth: 4)
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
            Text("centre \"8\"".uppercased())
                  .opacity(0.5)
            Spacer()
          }
          
          ScrollView(.horizontal) {
            HStack(spacing: 24) {
              ForEach(colorList, id: \.self) { colour in
                Button {
                  viewModel.textColor = colour
                } label: {
                  Rectangle()
                    .fill(colour)
                    .strokeBorder(.gray, lineWidth: 4)
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
                  .opacity(0.5)
            Spacer()
          }
          
          ScrollView(.horizontal) {
            HStack(spacing: 24) {
              ForEach(colorList, id: \.self) { colour in
                Button {
                  viewModel.innerColor = colour
                } label: {
                  Rectangle()
                    .fill(colour)
                    .strokeBorder(.gray, lineWidth: 4)
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
