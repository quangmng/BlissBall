//
//  BlissBallApp.swift
//  BlissBall
//
//  Created by Quang Minh Nguyen on 22/4/2024.
//

import SwiftUI

@main
struct BlissBallApp: App {
    @StateObject private var tabVM = TabViewModel()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(tabVM)
        }
    }
}
