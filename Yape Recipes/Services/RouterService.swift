//
//  RouterService.swift
//  Yape Recipes
//
//  Created by Crhistian David Vergara Gomez on 29/10/23.
//

import Foundation
import Combine
import SwiftUI

class RouterService: ObservableObject {
    
    @Published var route: NavigationPath = NavigationPath()
    
    func goToRecipe(recipe: RecipeModel) {
        route.append(recipe)
    }
    
    func goToRecipeLoactionMap (location: RecipeMapLocationModel) {
        route.append(location)
    }

    func goBack() {
        route.removeLast()
    }
}

