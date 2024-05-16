//
//  BlissBallApp.swift
//  BlissBall
//
//  Created by Quang Minh Nguyen on 22/4/2024.
//

import SwiftUI

@main
struct BlissBallApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    @AppStorage("themeSetting") var themeSetting: ThemeSettings = .system
    var body: some Scene {
        WindowGroup {
            ContentView()
                            .applyTheme(themeSetting)
                    }
                }
            }

            extension View {
                func applyTheme(_ themeSetting: ThemeSettings) -> some View {
                    switch themeSetting {
                    case .light:
                        return AnyView(self.environment(\.colorScheme, .light))
                    case .dark:
                        return AnyView(self.environment(\.colorScheme, .dark))
                    case .system:
                        return AnyView(self) // No color scheme, follow system setting
                    }
                }
            }

// MARK: - AppDelegate

class AppDelegate: NSObject, UIApplicationDelegate {
  
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    registerForPushNotifications()
      local4pmNotifs()
    return true
  }
  
  // MARK: - Notification Functions
  
  func registerForPushNotifications() {
    UNUserNotificationCenter.current()
      .requestAuthorization(options: [.alert, .sound, .badge]) {(granted, error) in
        print("Permission granted: \(granted)")
      }
  }
  
}
// MARK: - Local Checkin Notifs
func local4pmNotifs() {
    let identifier = "daily-check-in"
    let title = "Your Daily Check-in!"
    let body = "How are you feeling now? Check-in with us!"
    let hour = 16
    let minutes = 0
    let isDaily = true
    
    let notificationCentre = UNUserNotificationCenter.current()
    
    let content = UNMutableNotificationContent()
    content.title = title
    content.body = body
    content.sound = .default
    
    let calendar = Calendar.current
    var date = DateComponents(calendar: calendar, timeZone: TimeZone.current)
    date.hour = hour
    date.minute = minutes
    
    let trigger = UNCalendarNotificationTrigger(dateMatching: date, repeats: isDaily)
    let request = UNNotificationRequest(identifier: identifier, content: content, trigger: trigger)
    
    notificationCentre.removePendingNotificationRequests(withIdentifiers: [identifier])
    notificationCentre.add(request)
}
