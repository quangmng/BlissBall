//
//  HomeView.swift
//  BlissBubble
//
//  Created by JungWoo Choi on 29/4/2024.
//

import SwiftUI

struct HomeView: View {
  @EnvironmentObject var customBlissBallViewModel: CustomBlissBallViewModel
  
  
  var body: some View {
    NavigationStack {
      MainMenusView()
        
        .navigationTitle("Let's Get Things Done!")
        .navigationBarTitleDisplayMode(.large)
    }
  }
}

//MARK: - MainMenusView
private struct MainMenusView: View {
  @EnvironmentObject var customBlissBallViewModel: CustomBlissBallViewModel
  
  fileprivate var body: some View {
    VStack {
        VStack(alignment: .leading) {
            
        }
      
      ScrollView {
          NavigationLink(destination: {TaskView(taskListViewModel: TaskListViewModel())}()
            .toolbar(.hidden, for: .tabBar)){
          ZStack(alignment: .bottomLeading) {
            Image("menuImg1")
              .resizable()
              .frame(width: .infinity, height: .infinity)
            
            Text("Add your tasks")
              .font(.system(size: 28))
              .fontWeight(.semibold)
              .padding()
          }
          .frame(width: .infinity, height: 200)
        }
          
        
          NavigationLink(destination: {SelfAffirmationView()}()
            .toolbar(.hidden, for: .tabBar)) {
          ZStack(alignment: .bottomLeading) {
            Image("menuImg2")
              .resizable()
              .frame(width: .infinity, height: .infinity)
            
            Text("Self-affirmations")
              .font(.system(size: 28))
              .fontWeight(.semibold)
              .padding()
          }
          .frame(width: .infinity, height: 200)
        }
        
          NavigationLink(destination: {CustomView().environmentObject(customBlissBallViewModel)}()
            .toolbar(.hidden, for: .tabBar)) {
          ZStack {
            Rectangle()
              .foregroundStyle(.gray)
            
            Image("blissball")
              .resizable()
              .frame(width: 150, height: 150)
            
            
            VStack {
              Spacer()
              
              Text("Customise your ball")
                .font(.system(size: 28))
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
    .environmentObject(CustomBlissBallViewModel())
}
