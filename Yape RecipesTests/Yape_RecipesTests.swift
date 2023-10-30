//
//  Yape_RecipesTests.swift
//  Yape RecipesTests
//
//  Created by Crhistian David Vergara Gomez on 29/10/23.
//

import XCTest
import Combine
@testable import Yape_Recipes

final class Yape_RecipesTests: XCTestCase {

    var mockRequestServiceRepository: ApiService!
    var viewModel: RecipeViewModel!

    var cancellables = Set<AnyCancellable>()

    override func setUpWithError() throws {
        self.mockRequestServiceRepository = MockRequestAPIService(data: MockRecipesRequestResponse )
        self.viewModel = RecipeViewModel(apiRepository: mockRequestServiceRepository)
    }

    override func tearDownWithError() throws {}

    func testPerformanceExample() throws {
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func test_ShouldLoadAllRecipes() async throws {
        await viewModel.getRecipes()
        XCTAssertEqual(viewModel.recipes.count, MockRecipesRequestResponse.recipes.count, "Should has all recipes mock")
    }
    
    func test_ShouldFilterByRecipeName() async throws {
        await viewModel.getRecipes()
        viewModel.findBy(keyword: MockRecipesRequestResponse.recipes.first!.name)
        XCTAssertEqual(viewModel.recipes.count, 1, "Should has one recipe")
        XCTAssertEqual(viewModel.recipes.first?.name, MockRecipesRequestResponse.recipes.first!.name, "Should has the same data that mock")
    }

    func test_test_ShouldFilterByRecipeIngredients() async throws {
        let ingredient = MockRecipesRequestResponse.recipes.first!.ingredients[0]
        await viewModel.getRecipes()
        viewModel.findBy(keyword: ingredient)
        XCTAssertEqual(viewModel.recipes.count, 1, "Should has one recipe")
    }
}
