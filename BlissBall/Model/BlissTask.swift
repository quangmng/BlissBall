//
//  Task.swift
//  BlissBubble
//
//  Created by JungWoo Choi on 13/5/2024.
//

import Foundation

struct BlissTask: Hashable {
  var id = UUID()
  var title: String
  var content: String
}
