//
//  Quote.swift
//  BlissBubble
//
//  Created by JungWoo Choi on 13/5/2024.
//

import Foundation

struct Quote: Codable {
  let quote: String
  let author: String
  let hyperlink: String
  
  enum CodingKeys: String, CodingKey {
    case quote = "q"
    case author = "a"
    case hyperlink = "h"
  }
}
