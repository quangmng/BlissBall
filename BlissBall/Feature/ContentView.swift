//
//  ContentView.swift
//  BlissBall
//
//  Created by Quang Minh Nguyen on 22/4/2024.
//

import SwiftUI

struct ContentView: View {
  var body: some View {
    NavigationView {
      VStack {
        Text("BlissBall")
          .font(.system(size: 64))
          .fontWeight(.bold)
          .foregroundStyle(.primary)
          .padding(.top, 30)
        
        Spacer()
        
        //          ZStack {
        //            LuckyBall()
        //          }
        
        NavigationLink {
          MainTabView()
        } label: {
          Image("blissball")
            .resizable()
            .frame(width: 280, height: 280)
        }
        
        Text("Tap Ball to Begin")
          .font(.system(size: 18))
          .fontWeight(.semibold)
          .padding(.vertical, 20)
          .foregroundStyle(LinearGradient(
            colors: [.gray, .black],
            startPoint: .leading,
            endPoint: .trailing
          ))
        
        Spacer()
      }
      .padding()
    }
  }
}
// Consider either keeping this on a seperate file or remove. (recommend to keep, for ball customisation easiness)
struct LuckyBall: View {
  var body: some View {
    Circle()
      .frame(width:250)
      .foregroundColor(.black)
    Circle()
      .frame(width:150)
      .foregroundColor(.white)
      .padding([.leading, .top],40)
    Text("8")
      .font(.system(size: 70))
      .padding([.leading, .top],46)
  }
}

#Preview {
  ContentView()
}
