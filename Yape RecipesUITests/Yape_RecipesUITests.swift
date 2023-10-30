//
//  Yape_RecipesUITests.swift
//  Yape RecipesUITests
//
//  Created by Crhistian David Vergara Gomez on 29/10/23.
//

import XCTest

final class Yape_RecipesUITests: XCTestCase {
    
    override func setUpWithError() throws {
        continueAfterFailure = false
        XCUIApplication().launch()
    }
    
    override func tearDownWithError() throws {
    }
    
    func testRenderHome() throws {
        let app = XCUIApplication()
        app.launch()
        
        let homeTitleExpectation = expectation(
            for: NSPredicate(format: "exists == 1"),
            evaluatedWith: app.staticTexts["Recetas"], handler: nil
        )
        
        wait( for: [homeTitleExpectation], timeout: 5)
    } 

    func testFilterRecipes() throws {
        let app = XCUIApplication()
        app.launch()
        let selectorString = "Buscar por nombre o ingredientes"
        let titleRecipeSelector = "home_view_recipes_list"
        let filterText = "Sushi"

        let searchFieldExpectation = expectation(
            for: NSPredicate(format: "exists == 1"),
            evaluatedWith: app.searchFields[selectorString], handler: nil
        )
        wait( for: [searchFieldExpectation], timeout: 5)
        
        let searchField = app.searchFields[selectorString].firstMatch
        searchField.tap()
        searchField.typeText(filterText)
        sleep(2)

        let cardRecipeItemExpectation = expectation(
            for: NSPredicate(format: "exists == 1"),
            evaluatedWith: app.descendants(matching: .any)[titleRecipeSelector].firstMatch, handler: nil
        )
        wait( for: [cardRecipeItemExpectation], timeout: 5)

        let recipeElementSelected = app.descendants(matching: .any)[titleRecipeSelector].children(matching: .any)
        XCTAssertEqual(recipeElementSelected.count, 3, "Should shown 3 \(filterText) static-texts" )
    }
    
    func testNavigateToRecipe() throws {
        let app = XCUIApplication()
        app.launch()
        
        let cardRecipeItemExpectation = expectation(
            for: NSPredicate(format: "exists == 1"),
            evaluatedWith: app.buttons["recipe_list_item"].firstMatch, handler: nil
        )
        wait( for: [cardRecipeItemExpectation], timeout: 5)
        let cardRecipeIteButton = app.buttons["recipe_list_item"].firstMatch
        
        cardRecipeIteButton.tap()
        
        let recipeViewTitleExpectation = expectation(
            for: NSPredicate(format: "exists == 1"),
            evaluatedWith: app.staticTexts["recipe_view_title"].firstMatch, handler: nil
        )
        wait( for: [recipeViewTitleExpectation], timeout: 5)
        let recipeViewTitle = app.staticTexts["recipe_view_title"].firstMatch
        XCTAssertTrue(recipeViewTitle.exists, "Should shown a recipe title.")
    }
    
    func testNavigateToMap() throws {
        let app = XCUIApplication()
        app.launch()
        
        let cardRecipeItemExpectation = expectation(
            for: NSPredicate(format: "exists == 1"),
            evaluatedWith: app.buttons["recipe_list_item"].firstMatch, handler: nil
        )
        wait( for: [cardRecipeItemExpectation], timeout: 5)
        let cardRecipeIteButton = app.buttons["recipe_list_item"].firstMatch
        
        cardRecipeIteButton.tap()
        
        let recipeViewMapButtonExpectation = expectation(
            for: NSPredicate(format: "exists == 1"),
            evaluatedWith: app.buttons["recipe_view_map_button"].firstMatch, handler: nil
        )
        wait( for: [recipeViewMapButtonExpectation], timeout: 5)
        let recipeViewMapButton = app.buttons["recipe_view_map_button"].firstMatch
        
        recipeViewMapButton.tap()
        
        let recipeLocationViewRecipeTitleExpectation = expectation(
            for: NSPredicate(format: "exists == 1"),
            evaluatedWith: app.staticTexts["recipe_location_view_title"].firstMatch, handler: nil
        )
        wait( for: [recipeLocationViewRecipeTitleExpectation], timeout: 5)
        let recipeLocationViewRecipeTitle = app.staticTexts["recipe_location_view_title"].firstMatch
        XCTAssertTrue(recipeLocationViewRecipeTitle.exists, "Should shown a recipe title on map such as Annotation.")
    }
    
    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
