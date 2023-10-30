//
//  ContentView.swift
//  Yape Recipes
//
//  Created by Crhistian David Vergara Gomez on 29/10/23.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var viewModel: RecipeViewModel
    @EnvironmentObject var router: RouterService
    @State private var searchText = ""

    func onFilterBy(keyword: String) -> Void {
        viewModel.findBy(keyword: keyword)
    }
    
    var body: some View {
        HStack {
            List(viewModel.recipes) {
                HomeRecipeCellView(recipe: $0) {
                    router.goToRecipe(recipe: $0)
                }
                .listRowSeparator(.hidden)
            }
            .listStyle(.plain)
            .accessibilityIdentifier("home_view_recipes_list")
        }
        .toolbarTitleDisplayMode(.inlineLarge)
        .navigationTitle("Recetas")
        .searchable(text: $searchText, prompt: "Buscar por nombre o ingredientes")
        .onChange(of: searchText, { _, keyword in
            onFilterBy(keyword: keyword)
        })
        .onAppear() {
            Task {  [self] in
                if(self.viewModel.recipes.count > 0) { return }
                await self.viewModel.getRecipes()
            }
        }
    }
}

#Preview("Home Recipes") {
    let api = PreviewRequestAPIService(data: PreviewRecipesRequestData)
    @ObservedObject var viewModel = RecipeViewModel(apiRepository: api)
    return NavigationStack {
        HomeView(viewModel: viewModel)
    }
}
