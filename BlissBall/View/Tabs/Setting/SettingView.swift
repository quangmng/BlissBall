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
  @State private var isAboutTapped: Bool = false
  @State var isHealthDataOn: Bool = false
  
  @State private var sheetControl = false
  
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
          
            NavigationLink{
                
            } label: {
            Text("Check-in notifications")
          }
          
          Toggle(isOn: $isHealthDataOn) {
            Text("HealthKit Data Access")
          }
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
            sheetControl.toggle()
          } label: {
            Text("Clear all user entries")
          }
          .foregroundStyle(.red)
        }
      }
      .navigationTitle("Settings")
    }
    .alert("Are you sure to clear out your task and motivation entries?", isPresented: $sheetControl) {
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
