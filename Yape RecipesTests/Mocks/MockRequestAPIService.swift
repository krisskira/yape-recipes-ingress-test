//
//  MockRequestAPIService.swift
//  Yape RecipesTests
//
//  Created by Crhistian David Vergara Gomez on 29/10/23.
//

import Foundation
@testable import Yape_Recipes

class MockRequestAPIService: ApiService {
    let data: Codable
    var getCalled: Bool = false
    
    init(data: Codable) {
        self.data = data
    }
    
    func get<T>(endpoint: Endpoint) async -> (T?, Error?) where T : Decodable, T : Encodable {
        getCalled = true
        return (self.data as? T, nil)
    }
}
