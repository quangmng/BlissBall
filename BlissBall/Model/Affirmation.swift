//
//  Affirmation.swift
//  BlissBubble
//
//  Created by JungWoo Choi on 13/5/2024.
//

import Foundation

struct Affirmation: Hashable, Codable, Identifiable {
  var id = UUID()
  var title: String
}
