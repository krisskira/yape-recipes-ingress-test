//
//  RecipeRequestModel.swift
//  Yape Recipes
//
//  Created by Crhistian David Vergara Gomez on 29/10/23.
//

import Foundation

struct RecipeRequestModel: Codable, Hashable {
    var page: Int
    var per_page: Int
    var total_recipes: Int
    var recipes: [RecipeModel]
}
