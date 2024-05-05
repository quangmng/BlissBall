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
      MainMenusView(userName: userName)
        .toolbar {
          Button("Help") {
            //
          }
        }
    }
  }
}

//MARK: - MainMenusView
private struct MainMenusView: View {
  let userName: String
  
  fileprivate var body: some View {
    VStack {
      VStack(alignment: .leading) {
        Text("Welcome, \(userName)")
        
        Text("Let's Get Things Done!")
          .font(.largeTitle)
          .fontWeight(.bold)
      }
      
      ScrollView {
        NavigationLink(destination: TaskView()) {
          ZStack(alignment: .bottomLeading) {
            Image("menuImg1")
              .resizable()
              .frame(width: .infinity, height: .infinity)
            
            Text("Add your tasks")
              .font(.system(size: 24))
              .fontWeight(.semibold)
              .padding()
          }
          .frame(width: .infinity, height: 200)
        }
        
        NavigationLink(destination: SelfAffirmationView()) {
          ZStack(alignment: .bottomLeading) {
            Image("menuImg2")
              .resizable()
              .frame(width: .infinity, height: .infinity)
            
            Text("Self-affirmations")
              .font(.system(size: 24))
              .fontWeight(.semibold)
              .padding()
          }
          .frame(width: .infinity, height: 200)
        }
        
        NavigationLink(destination: CustomView()) {
          ZStack {
            Rectangle()
              .foregroundStyle(.gray)
            
            Image("blissball")
              .resizable()
              .frame(width: 150, height: 150)
            
            
            VStack {
              Spacer()
              
              Text("Customise bliss ball")
                .font(.system(size: 24))
                .fontWeight(.semibold)
                .padding()
                .frame(maxWidth: .infinity, alignment: .bottomLeading)
            }
          }
          .frame(width: .infinity, height: 200)
        }

      }
      .foregroundStyle(.white)
      .scrollIndicators(.hidden)
    }
  }
}

#Preview {
  HomeView()
}
