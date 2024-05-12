//
//  BlissBallViewModel.swift
//  BlissBubble
//
//  Created by JungWoo Choi on 13/5/2024.
//

import Foundation

class BlissBallViewModel: ObservableObject {
  @Published var quoteData: Quote?
  
  let baseURL = "https://zenquotes.io/api/random"
  
//  func fetchData() async -> Void {
//    guard let downloadedQuote: Quote = await WebService().downloadData(fromURL: baseURL) else {return}
//    quoteData = downloadedQuote
//  }
  
  func fetchData() {
    if let url = URL(string: baseURL) {
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print(error)
                return
            }
            if let safeData = data {
                self.parseJSON(quoteData: safeData)
            }
        }
        task.resume()
    }
  }
  
  func parseJSON(quoteData: Data) {
      let decoder = JSONDecoder()
      do {
          let decodedData = try decoder.decode(Quote.self, from: quoteData)
          DispatchQueue.main.async {
              self.quoteData = decodedData
          }
      } catch {
          print(error)
      }
  }
}
