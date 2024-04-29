//
//  HomeView.swift
//  BlissBubble
//
//  Created by JungWoo Choi on 29/4/2024.
//

import SwiftUI

struct HomeView: View {
  let userName: String = "User1"
    var body: some View {
      NavigationStack {
        VStack {
          VStack(alignment: .leading) {
            Text("Welcome, \(userName)")
            
            Text("Let's Get Things Done!")
              .font(.largeTitle)
              .fontWeight(.bold)
          }
          
          ScrollView {
            ForEach(0..<4) { menu in
              ZStack(alignment: .bottomLeading) {
                Rectangle()
                  .frame(width: .infinity, height: 200)
//                  .border(Color.black) // Checking area
                  .foregroundStyle(.gray)
                
                Text("Add your tasks")
                  .font(.system(size: 24))
                  .fontWeight(.semibold)
                  .padding()
              }
            }
          }
          .scrollIndicators(.hidden)
        }
        .toolbar {
          Button("Help") {
            //
          }
        }
        .navigationBarBackButtonHidden()
      }
    }
}

#Preview {
    HomeView()
}
