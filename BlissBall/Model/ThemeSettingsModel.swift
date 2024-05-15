//
//  ThemeSettingsModel.swift
//  BlissBubble
//
//  Created by Quang Minh Nguyen on 15/5/2024.
//

import Foundation

enum ThemeSettings: String, CaseIterable, Identifiable, Codable {
    case light = "Light"
    case dark = "Dark"
    case system = "Follow system theme"
    var id: String { self.rawValue }
}
