//
//  SettingView.swift
//  BlissBubble
//
//  Created by JungWoo Choi on 3/5/2024.
//

import SwiftUI


struct SettingView: View {
  @State var isHapticOn: Bool = true
  @State var isDarkModeOn: Bool = false
  @State var isNotifOn: Bool = false
  @State var isHealthDataOn: Bool = false
  
  @State var sheetControl = false
  
  var body: some View {
    NavigationStack {
      List {
        Section {
          Toggle(isOn: $isHapticOn) {
            Text("Haptic Feedback")
          }
          
          Toggle(isOn: $isDarkModeOn) {
            Text("Dark Mode")
          }
          
          Toggle(isOn: $isNotifOn) {
            Text("Check-in notifications")
          }
          
          Toggle(isOn: $isHealthDataOn) {
            Text("HealthKit Data Access")
          }
        }
        
        Section {
          NavigationLink {
            AboutView()
          } label: {
            Text("About this app")
          }
          .foregroundStyle(.blue)
        }
        
        Section {
          Button {
            sheetControl.toggle()
          } label: {
            Text("Clear all user entries")
          }
          .foregroundStyle(.red)
        }
      }
      .navigationTitle("Settings")
    }
    .alert("Alert", isPresented: $sheetControl) {
      Button {
        //
      } label: {
        Text("Cancel")
      }
      
      Button {
        //
      } label: {
        Text("Clear")
      }
    }
  }
}

#Preview {
  SettingView()
}
