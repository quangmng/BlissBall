//
//  SettingView.swift
//  BlissBubble
//
//  Created by JungWoo Choi on 3/5/2024.
//

import SwiftUI


struct SettingView: View {
    @State var isDarkModeOn: Bool = false
    @State var isHapticOn: Bool = false
    @State var isNotifOn: Bool = false
    @State var isHealthDataOn: Bool = false
    @State var aboutSheet: Bool = false
    var body: some View {
        NavigationStack{
            List{
                HStack{
                    Toggle(isOn: $isHapticOn) {
                        Text("Haptic Feedback")
                    }
                }
                HStack{
                    Toggle(isOn: $isDarkModeOn) {
                        Text("Dark Mode")
                    }
                }
                HStack{
                    Toggle(isOn: $isNotifOn) {
                        Text("Check-in notifications")
                    }
                }
//                HStack{
//                    Toggle(isOn: $isHealthDataOn) {
//                        Text("HealthKit Data Access")
//                    }
//                }
                HStack{
                    //About screen shows as a sheet (App name, icon, version number e.g. 1.0, Made with support of Inter8ctors and our iOS team*)
                    Text("About BlissBall")
                        .foregroundStyle(.blue)
                }
//                HStack{
//                    //.alert "are you sure to clear out all your tasks and self-affirmations?" - option 1 Delete - option 2 Cancel
//                    Text("Clear All User Entries")
//                        .foregroundStyle(.red)
//                }
            }
            .navigationTitle("Settings")
        }
        
//        HStack{
//          //.alert "are you sure to clear out all your tasks and self-affirmations?" - option 1 Delete - option 2 Cancel
//          Text("Clear All User Entries")
//            .foregroundStyle(.red)
//        }
        .navigationTitle("Settings")
      }
    }
    


#Preview {
  SettingView()
}
