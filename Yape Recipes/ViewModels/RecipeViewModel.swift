//
//  RecipeViewModel.swift
//  Yape Recipes
//
//  Created by Crhistian David Vergara Gomez on 29/10/23.
//

import Foundation
import Combine

class RecipeViewModel: ObservableObject {
    @Published var recipes: [RecipeModel] = []
    @Published var showLoading: Bool = false
    @Published var showError: Bool = false
    @Published var errorMessage: String? = nil

    private var allRecipes: [RecipeModel] = []
    private let apiRepository: ApiService
    private var cancellables = Set<AnyCancellable>()
    
    var showEmptyList: Bool {
        get { return recipes.isEmpty }
    }
    
    init( apiRepository: ApiService = RequestAPIService() ){
        self.apiRepository = apiRepository
    }
    
    func findBy(keyword: String) {
        if keyword.isEmpty {
            recipes = allRecipes
            return
        }
        recipes = allRecipes.filter {
            $0.name.lowercased().contains(keyword.lowercased()) ||
            $0.ingredients.joined(separator: ", ").lowercased().contains(keyword.lowercased())
        }
    }
    
    func getRecipes() async {
        defer {
            DispatchQueue.main.async {
                self.showLoading =  false
            }
        }
        if let recipes = await callApiToGetRecipes() {
            self.recipes = recipes
            self.allRecipes = recipes
            return
        }
        self.recipes = []
        self.allRecipes = []
    }
    
    private func callApiToGetRecipes() async -> [RecipeModel]? {
        let (response, error) = await apiRepository.get(endpoint: .Recipes) as (RecipeRequestModel?, Error?)
        if let recipes = response?.recipes {
            return recipes
        }
        errorMessage = error?.localizedDescription ?? "Data is unreadable"
        showError = true
        return nil
    }
}
