//
//  RecipesApp.swift
//  Yape Recipes
//
//  Created by Crhistian David Vergara Gomez on 29/10/23.
//

import SwiftUI
import Combine
@main
struct RecipesApp: App {
    @ObservedObject private var routerService = RouterService()
    @ObservedObject var recipeViewModel = RecipeViewModel()

    var body: some Scene {
        WindowGroup {
            NavigationStack(path: $routerService.route) {
                HomeView(viewModel: recipeViewModel)
                    .navigationDestination(for: RecipeModel.self) {
                        RecipeView(recipe: $0)
                    }
                    .navigationDestination(for: RecipeMapLocationModel.self) {
                        RecipeLocationView(mapLocation: $0)
                    }

            }
            .environmentObject(routerService)
        }
    }
}
