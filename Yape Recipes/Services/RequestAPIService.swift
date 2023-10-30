//
//  RequestAPIService.swift
//  Yape Recipes
//
//  Created by Crhistian David Vergara Gomez on 29/10/23.
//

import Foundation

class RequestAPIService: ApiService {
    let baseUrl: String
    init() {
        baseUrl = Bundle.main.object(forInfoDictionaryKey: "ApiUrlRequest") as! String
    }

    func get<T: Codable>(endpoint: Endpoint) async -> (T?, Error?) {
        do {
            guard let url = endpoint.buildUrl(baseUrl: baseUrl) else {
                return (
                    nil,
                    NSError(
                        domain: "API",
                        code: 0,
                        userInfo: [
                            NSURLErrorKey : "URL does not valid"
                        ]))
            }
            let (data, _) = try await URLSession.shared.data(from: url)
            
            let json = try JSONDecoder().decode(T.self, from: data)
            return (json, nil)
        } catch {
            return (nil, error)
        }
    }
}
