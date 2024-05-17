//
//  Task.swift
//  BlissBubble
//
//  Created by JungWoo Choi on 13/5/2024.
//

import Foundation

struct BlissTask: Identifiable, Hashable, Encodable, Decodable {
  var id = UUID()
  var title: String
}
