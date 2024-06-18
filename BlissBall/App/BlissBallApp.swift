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

class AppDelegate: NSObject, UIApplicationDelegate, UNUserNotificationCenterDelegate  {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
            UNUserNotificationCenter.current().delegate = self
            registerForPushNotifications()
            scheduleDailyNotification()
            return true
        }
        
        // MARK: - Notification Functions
        
        func registerForPushNotifications() {
            UNUserNotificationCenter.current()
                .requestAuthorization(options: [.alert, .sound, .badge]) { (granted, error) in
                    print("Permission granted: \(granted)")
                    guard granted else { return }
                    self.getNotificationSettings()
                }
        }
        
        func getNotificationSettings() {
            UNUserNotificationCenter.current().getNotificationSettings { settings in
                print("Notification settings: \(settings)")
                guard settings.authorizationStatus == .authorized else { return }
                DispatchQueue.main.async {
                    UIApplication.shared.registerForRemoteNotifications()
                }
            }
        }
        
        func scheduleDailyNotification() {
            let identifier = "daily-check-in"
            let title = "Your Daily Check-in!"
            let body = "How are you feeling now? Check-in with us and get something done!"
            
            let notificationCentre = UNUserNotificationCenter.current()
            
            let content = UNMutableNotificationContent()
            content.title = title
            content.body = body
            content.sound = UNNotificationSound(named: UNNotificationSoundName(rawValue: "chime2.m4a"))
            
            let hour = UserDefaults.standard.integer(forKey: "notificationHour")
            let minute = UserDefaults.standard.integer(forKey: "notificationMinute")
            
            let calendar = Calendar.current
            var date = DateComponents(calendar: calendar, timeZone: TimeZone.current)
            date.hour = hour
            date.minute = minute
            
            let trigger = UNCalendarNotificationTrigger(dateMatching: date, repeats: true)
            let request = UNNotificationRequest(identifier: identifier, content: content, trigger: trigger)
            
            notificationCentre.removePendingNotificationRequests(withIdentifiers: [identifier])
            notificationCentre.add(request) { (error) in
                if let error = error {
                    print("Error adding notification: \(error.localizedDescription)")
                } else {
                    print("Notification scheduled for \(hour):\(String(format: "%02d", minute))")
                }
            }
        }
        
        // Handle notification when the app is in the foreground
        func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
            completionHandler([.banner, .sound])
        }
    }


