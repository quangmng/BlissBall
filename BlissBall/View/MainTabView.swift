//
//  TabView.swift
//  BlissBubble
//
//  Created by JungWoo Choi on 3/5/2024.
//

import SwiftUI

struct MainTabView: View {
  @EnvironmentObject var customBlissBallViewModel: CustomBlissBallViewModel
  
  @State var selectedTab: Tab = .home
  
  var body: some View {
    TabView(selection: $selectedTab) {
      HomeView()
        .environmentObject(customBlissBallViewModel)
        .tabItem {
          Label("Home", systemImage: "house")
            .environment(\.symbolVariants, selectedTab == .home ? .fill : .none)
        }
        .tag(Tab.home)
      
      BlissBallView()
        .tabItem {
          Label("BlissBall", systemImage: "8.circle")
            .environment(\.symbolVariants, selectedTab == .blissball ? .fill : .none)
        }
        .tag(Tab.blissball)
      
      SettingView()
        .tabItem {
          Label("Settings", systemImage: "gearshape")
            .environment(\.symbolVariants, selectedTab == .setting ? .fill : .none)
        }
        .tag(Tab.setting)
    }
    .tint(.black)
    .navigationBarBackButtonHidden()
  }
}

#Preview {
  MainTabView()
    .environmentObject(CustomBlissBallViewModel())
}
