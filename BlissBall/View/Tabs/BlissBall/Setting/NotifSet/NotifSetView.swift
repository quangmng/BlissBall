//
//  NotifSetView.swift
//  BlissBubble
//
//  Created by Quang Minh Nguyen on 14/5/2024.
//
import SwiftUI

struct NotifSetView: View {
    @AppStorage("notificationHour") private var notificationHour: Int = 16
    @AppStorage("notificationMinute") private var notificationMinute: Int = 0
    
    @State private var selectedTime = Date()

    var body: some View {
        VStack(spacing: 20) {
            Text("Select Notification Time")
                .font(.headline)
                .padding(.top, 20)
            
            DatePicker("Notification Time", selection: $selectedTime, displayedComponents: .hourAndMinute)
                .labelsHidden()
                .datePickerStyle(WheelDatePickerStyle())
                .onChange(of: selectedTime) {a, b in
                    let calendar = Calendar.current
                    let components = calendar.dateComponents([.hour, .minute], from: b )
                    notificationHour = components.hour ?? 16
                    notificationMinute = components.minute ?? 0
                    AppDelegate().scheduleDailyNotification()
                }
            
            Text("Current Notification Time: \(String(format: "%02d", notificationHour)):\(String(format: "%02d", notificationMinute))")
                .font(.subheadline)
                .padding(.bottom, 20)
            
            //Spacer()
        }
        .padding()
    }
}

#Preview {
    NotifSetView()
}
