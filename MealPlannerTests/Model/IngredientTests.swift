//
//  IngredientTests.swift
//  MealPlannerTests
//
//  Created by Joshua Rogers on 17/03/2022.
//

import XCTest
@testable import MealPlanner

class IngredientTests: XCTestCase {
    var persistenceController: PersistenceController!
    
    override func setUpWithError() throws {
        persistenceController = PersistenceController(inMemory: true)
    }

    override func tearDownWithError() throws {
        persistenceController = nil
    }
    
    func test_Ingredient_WhenNameIsNotNil_WrappedNameShouldReturnName() {
        let ingredient = Ingredient(context: persistenceController.container.viewContext)
        let name = "test"
        
        ingredient.name = name
        
        XCTAssertEqual(ingredient.wrappedName, name)
    }
    
    func test_Ingredient_WhenNameIsNil_WrappedNameShouldReturnUnknownName() {
        let ingredient = Ingredient(context: persistenceController.container.viewContext)
        
        XCTAssertEqual(ingredient.wrappedName, "Unknown name")
    }
    
    func test_Ingredient_WhenUnitIsNotNil_WrappedUnitShouldReturnUnit() {
        let ingredient = Ingredient(context: persistenceController.container.viewContext)
        let unit = "test"
        
        ingredient.unit = unit
        
        XCTAssertEqual(ingredient.wrappedUnit, unit)
    }
    
    func test_Ingredient_WhenUnitIsNil_WrappedUnitShouldReturnEmptyString() {
        let ingredient = Ingredient(context: persistenceController.container.viewContext)
        
        XCTAssertEqual(ingredient.wrappedUnit, "")
    }
    
    func test_Ingredient_WhenCreated_RecipeIngredientsArrayShouldReturnEmptyArray() {
        let ingredient = Ingredient(context: persistenceController.container.viewContext)
        
        XCTAssertTrue(ingredient.recipeIngredients?.count == 0)
    }
}
