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
                HStack{
                    Toggle(isOn: $isHealthDataOn) {
                        Text("HealthKit Data Access")
                    }
                }
                HStack{
                    Text("Clear All User Entries")
                        .foregroundStyle(.red)
                }
            }
            .navigationTitle("Settings")
        }
        
    }
}

#Preview {
    SettingView()
}
