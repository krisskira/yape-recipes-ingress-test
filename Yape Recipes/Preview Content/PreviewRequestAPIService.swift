//
//  PreviewRequestAPIService.swift
//  Yape Recipes
//
//  Created by Crhistian David Vergara Gomez on 29/10/23.
//

import Foundation

class PreviewRequestAPIService: ApiService {
    let data: Codable
    
    init(data: Codable) {
        self.data = data
    }

    func get<T>(endpoint: Endpoint) async -> (T?, Error?) where T : Decodable, T : Encodable {
        return (self.data as? T, nil)
    }
}
