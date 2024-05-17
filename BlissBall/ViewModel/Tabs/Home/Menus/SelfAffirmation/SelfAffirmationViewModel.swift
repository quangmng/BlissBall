//
//  SelfAffirmationViewModel.swift
//  BlissBubble
//
//  Created by JungWoo Choi on 13/5/2024.
//

import Foundation
import Combine


class SelfAffirmationViewModel: ObservableObject {
  @Published var affirmations: [Affirmation]
  @Published var searchEntry: String
  @Published var quoteData: Quote?
    
    let baseURL = "https://zenquotes.io/api/random"
    
    func fetchData() async -> Void {
      guard let downloadedQuote: [Quote] = await WebService().downloadData(fromURL: baseURL) else { return }
      quoteData = downloadedQuote[0]
    }
  var searchResults: [Affirmation] {
    guard !searchEntry.isEmpty else { return affirmations }
    return affirmations.filter { affirmation in
      affirmation.title.lowercased().contains(searchEntry.lowercased())
    }
  }
  
    private var cancellables = Set<AnyCancellable>()
    private let userDefaultsKey = "affirmations"
    
    
  init(
    affirmations: [Affirmation] = [],
    searchEntry: String = "") {
    self.affirmations = affirmations
    self.searchEntry = searchEntry
  }
  
  func delete(at offsets: IndexSet) {
    affirmations.remove(atOffsets: offsets)
      saveAffirmations(affirmations)
  }
  
  func addAffirmation(_ affirmation: Affirmation) {
    affirmations.append(affirmation)
      saveAffirmations(affirmations)
  }
    
    private func saveAffirmations(_ affirmations: [Affirmation]) {
        if let data = try? JSONEncoder().encode(affirmations) {
            UserDefaults.standard.set(data, forKey: userDefaultsKey)
        }
    }
    func loadTasks() {
        if let data = UserDefaults.standard.data(forKey: userDefaultsKey),
           let savedAffirmations = try? JSONDecoder().decode([Affirmation].self, from: data) {
            affirmations = savedAffirmations
        }
    }
}
