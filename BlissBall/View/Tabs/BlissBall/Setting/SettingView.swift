//
//  SettingView.swift
//  BlissBubble
//
//  Created by JungWoo Choi on 3/5/2024.
//

import SwiftUI


struct SettingView: View {
  @State private var isHapticOn = true
    @AppStorage("themeSetting") var themeSetting: ThemeSettings = .system  // Default to system theme
  @State private var isAboutTapped = false
  @State private var isNotifSettingTapped = false
  @State private var isHealthDataOn = false
  @State private var clearAll = false
  
  var body: some View {
    NavigationStack {
      List {
        Section {
          Toggle(isOn: $isHapticOn) {
            Text("Haptic Feedback (Planned)")
          }
          
            Picker("Theme", selection: $themeSetting) {
                ForEach(ThemeSettings.allCases) { setting in
                    Text(setting.rawValue).tag(setting)
                }
                                }
          .pickerStyle(.menu) // Adjust this to .inline or .wheel as per your design needs
          
          
          Toggle(isOn: $isHealthDataOn) {
            Text("HealthKit Data Access (Planned)")
          }
          
          Button{
            isNotifSettingTapped.toggle()
          } label: {
            Text("Check-in notifications")
          }
          .sheet(isPresented: $isNotifSettingTapped, content: {
            NotifSetView()
              .presentationDetents([.height(550), .height(650)])
            Button("Back to Settings") {
              isNotifSettingTapped = false
            }
            .padding(.top, 15)
            .buttonStyle(.borderedProminent)
          })
        }
        
        
        
        Section {
          Button{
            isAboutTapped.toggle()
          } label: {
            Text("About this app")
          }
          .foregroundStyle(.blue)
          .sheet(isPresented: $isAboutTapped, content: {
            AboutView()
              .presentationDetents([.height(550), .height(650)])
            Button("Back to Settings") {
              isAboutTapped = false
            }
            .padding(.top, 15)
            .buttonStyle(.borderedProminent)
          })
          
        }
      }
      .navigationTitle("Settings")
    }
    
  }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView().environmentObject(CustomBlissBallViewModel())
        
    }
}
