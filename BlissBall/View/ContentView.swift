//
//  ContentView.swift
//  BlissBall
//
//  Created by Quang Minh Nguyen on 22/4/2024.
//

import SwiftUI

struct ContentView: View {
  @StateObject var customBlissBallViewModel = CustomBlissBallViewModel()
  
  var body: some View {
    NavigationView {
      VStack {
        Text("BlissBall")
          .font(.system(size: 64))
          .fontWeight(.bold)
          .foregroundStyle(.primary)
          .padding(.top, 30)
        
        Spacer()
        
        NavigationLink {
          MainTabView()
            .environmentObject(customBlissBallViewModel)
        } label: {
          CustomBlissBallView()
            .environmentObject(customBlissBallViewModel)
        }
        
        Text("Tap Ball to Begin")
          .font(.system(size: 18))
          .fontWeight(.semibold)
          .padding(.vertical, 20)
//          .foregroundStyle(LinearGradient(
//            colors: [.gray, .black],
//            startPoint: .leading,
//            endPoint: .trailing
//          ))
        
        Spacer()
      }
      .padding()
    }
  }
}

#Preview {
  ContentView()
}
