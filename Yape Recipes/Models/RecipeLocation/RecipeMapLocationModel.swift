//
//  RecipeLocationModel.swift
//  Yape Recipes
//
//  Created by Crhistian David Vergara Gomez on 29/10/23.
//

import Foundation

struct RecipeMapLocationModel: Codable, Hashable  {
    let location: LocationModel
    let name: String
}
