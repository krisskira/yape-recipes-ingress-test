//
//  Definitions.swift
//  Yape Recipes
//
//  Created by Crhistian David Vergara Gomez on 29/10/23.
//

import Foundation


enum Endpoint {
    case Recipes

    func buildUrl(baseUrl: String) -> URL? {
        switch self {
        case .Recipes:
            return URL(string: "\(baseUrl)/recipes")
        }
    }
}

protocol ApiService {
    func get<T: Codable>(endpoint: Endpoint) async -> (T?, Error?)
}
