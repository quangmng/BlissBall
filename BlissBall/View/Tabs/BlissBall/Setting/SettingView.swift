//
//  SettingView.swift
//  BlissBubble
//
//  Created by JungWoo Choi on 3/5/2024.
//

import SwiftUI


struct SettingView: View {
  @State private var isHapticOn = true
  @State private var themeSetting: ThemeSettings = .system // This will hold the current theme setting
  @State private var isAboutTapped = false
  @State private var isNotifSettingTapped = false
  @State private var isHealthDataOn = false
  @State private var clearAll = false
  
  var body: some View {
    NavigationStack {
      List {
        Section {
          Toggle(isOn: $isHapticOn) {
            Text("Haptic Feedback")
          }
          
          Picker("Theme", selection: $themeSetting) {
            ForEach(ThemeSettings.allCases) { setting in
              Text(setting.rawValue).tag(setting)
            }
          }
          .pickerStyle(.menu) // Adjust this to .inline or .wheel as per your design needs
          
          
          Toggle(isOn: $isHealthDataOn) {
            Text("HealthKit Data Access")
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
        
        Section {
          Button {
            clearAll.toggle()
          } label: {
            Text("Clear all user entries")
          }
          .foregroundStyle(.red)
        }
      }
      .navigationTitle("Settings")
    }
    .alert("Are you sure to clear out your task and motivation entries?", isPresented: $clearAll) {
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
  SettingView().environmentObject(CustomBlissBallViewModel())
  
}
