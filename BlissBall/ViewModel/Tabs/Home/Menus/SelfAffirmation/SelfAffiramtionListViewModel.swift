//
//  SelfAffiramtionListViewModel.swift
//  BlissBubble
//
//  Created by JungWoo Choi on 13/5/2024.
//

import Foundation

class SelfAffiramtionListViewModel: ObservableObject {
  @Published var affirmations: [Affirmation]
  @Published var searchEntry: String
  
  var searchResults: [Affirmation] {
    guard !searchEntry.isEmpty else { return affirmations }
    return affirmations.filter { affirmation in
      affirmation.title.lowercased().contains(searchEntry.lowercased())
    }
  }
  
  init(
    affirmations: [Affirmation] = [],
    searchEntry: String = "") {
    self.affirmations = affirmations
    self.searchEntry = searchEntry
  }
  
  func delete(at offsets: IndexSet) {
    affirmations.remove(atOffsets: offsets)
  }
  
  func addAffirmation(_ affirmation: Affirmation) {
    affirmations.append(affirmation)
  }
}
