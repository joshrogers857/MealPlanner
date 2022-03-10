//
//  RecipeListTests.swift
//  MealPlannerTests
//
//  Created by Joshua Rogers on 08/03/2022.
//

import XCTest
@testable import MealPlanner

class RecipeListViewModelTests: XCTestCase {
    
    func test_RecipeListViewModel_WhenCreated_RecipeListShouldHave15Recipes() {
        let vm = RecipeListViewModel()
        
        let numberOfRecipes = vm.recipeList.count
        
        XCTAssertEqual(numberOfRecipes, 15)
    }
}
