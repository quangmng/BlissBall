//
//  WebService.swift
//  BlissBubble
//
//  Created by JungWoo Choi on 13/5/2024.
//

import Foundation

class WebService {
    func downloadData<T: Codable>(fromURL: String) async -> T? {
        do {
            guard let url = URL(string: fromURL) else { throw NetworkError.badUrl }
            let (data, response) = try await URLSession.shared.data(from: url)
            guard let response = response as? HTTPURLResponse else { throw NetworkError.badResponse }
            guard response.statusCode >= 200 && response.statusCode < 300 else { throw NetworkError.badStatus }
            guard let decodedResponse = try? JSONDecoder().decode(T.self, from: data) else { throw NetworkError.failedToDecodeResponse }
            
            return decodedResponse
        } catch NetworkError.badUrl {
            print("DEBUG: There was an error creating the URL")
        } catch NetworkError.badResponse {
            print("DEBUG: Did not get a valid response")
        } catch NetworkError.badStatus {
            print("DEBUG: Did not get a 2xx status code from the response")
        } catch NetworkError.failedToDecodeResponse {
            print("DEBUG: Failed to decode response into the given type")
        } catch {
            print("DEBUG: An error occured downloading the data")
        }
        
        return nil
    }
}
