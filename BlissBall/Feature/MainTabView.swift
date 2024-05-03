//
//  TabView.swift
//  BlissBubble
//
//  Created by JungWoo Choi on 3/5/2024.
//

import SwiftUI

struct MainTabView: View {
  @State var selectedTab: Tab = .home
  
  var body: some View {
    TabView(selection: $selectedTab) {
      HomeView()
        .tabItem {
          Label("Home", systemImage: "house")
            .environment(\.symbolVariants, selectedTab == .home ? .fill : .none)
        }
        .tag(Tab.home)
      
      BlissBallView()
        .tabItem {
          Label("Home", systemImage: "8.circle")
            .environment(\.symbolVariants, selectedTab == .blissball ? .fill : .none)
        }
        .tag(Tab.blissball)
      
      SettingView()
        .tabItem {
          Label("Home", systemImage: "gearshape")
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
}
