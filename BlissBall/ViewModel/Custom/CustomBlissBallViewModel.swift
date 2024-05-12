//
//  CustomBlissBallViewModel.swift
//  BlissBubble
//
//  Created by JungWoo Choi on 12/5/2024.
//

import Foundation
import SwiftUI

class CustomBlissBallViewModel: ObservableObject {
  @Published var extRadius: CGFloat
  @Published var innerRadius: CGFloat
  @Published var extColor: Color
  @Published var innerColor: Color
  @Published var textColor: Color
  
  init(
    extRadius: CGFloat = 300,
    innerRadius: CGFloat = 180,
    extColor: Color = .black,
    innerColor: Color = .white,
    textColor: Color = .black
  ) {
    self.extRadius = extRadius
    self.innerRadius = innerRadius
    self.extColor = extColor
    self.innerColor = innerColor
    self.textColor = textColor
  }
  
  
}
