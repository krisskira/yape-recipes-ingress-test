//
//  Recipe.swift
//  Yape Recipes
//
//  Created by Crhistian David Vergara Gomez on 29/10/23.
//

import Foundation

struct LocationModel: Codable, Hashable  {
    var lat: Double
    var lng: Double
    init(lat: Double, lng: Double) {
        self.lat = lat
        self.lng = lng
    }
}

struct RecipeModel: Codable, Identifiable, Hashable {
    var id: Int
    var name: String
    var ingredients: [String]
    var images: [String]
    var location: LocationModel
    var description: String
    
    init(id: Int, name: String, ingredients: [String], images: [String], location: LocationModel, description: String) {
        self.id = id
        self.name = name
        self.ingredients = ingredients
        self.images = images
        self.location = location
        self.description = description
    }
}
