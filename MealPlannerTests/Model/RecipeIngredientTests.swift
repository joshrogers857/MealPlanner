//
//  RecipeIngredientTests.swift
//  MealPlannerTests
//
//  Created by Joshua Rogers on 22/03/2022.
//

import XCTest
@testable import MealPlanner

class RecipeIngredientTests: XCTestCase {
    var persistenceController: PersistenceController!
    
    override func setUpWithError() throws {
        persistenceController = PersistenceController(inMemory: true)
    }

    override func tearDownWithError() throws {
        persistenceController = nil
    }
    
    func test_RecipeIngredient_WhenIngredientIsNil_CaloriesShouldBeZero() {
        let recipeIngredient = RecipeIngredient(context: persistenceController.container.viewContext)
        
        let result = recipeIngredient.calories
        
        XCTAssertEqual(result, 0)
    }
    
    func test_RecipeIngredient_WhenIngredientIsNil_CarbsShouldBeZero() {
        let recipeIngredient = RecipeIngredient(context: persistenceController.container.viewContext)
        
        let result = recipeIngredient.carbs
        
        XCTAssertEqual(result, 0.0)
    }
    
    func test_RecipeIngredient_WhenIngredientIsNil_FatShouldBeZero() {
        let recipeIngredient = RecipeIngredient(context: persistenceController.container.viewContext)
        
        let result = recipeIngredient.fat
        
        XCTAssertEqual(result, 0.0)
    }
    
    func test_RecipeIngredient_WhenIngredientIsNil_FibreShouldBeZero() {
        let recipeIngredient = RecipeIngredient(context: persistenceController.container.viewContext)
        
        let result = recipeIngredient.fibre
        
        XCTAssertEqual(result, 0.0)
    }
    
    func test_RecipeIngredient_WhenIngredientIsNil_ProteinShouldBeZero() {
        let recipeIngredient = RecipeIngredient(context: persistenceController.container.viewContext)
        
        let result = recipeIngredient.protein
        
        XCTAssertEqual(result, 0.0)
    }
    
    func test_RecipeIngredient_WhenIngredientIsNil_SaltShouldBeZero() {
        let recipeIngredient = RecipeIngredient(context: persistenceController.container.viewContext)
        
        let result = recipeIngredient.salt
        
        XCTAssertEqual(result, 0.0)
    }
    
    func test_RecipeIngredient_WhenIngredientIsNil_SaturatesShouldBeZero() {
        let recipeIngredient = RecipeIngredient(context: persistenceController.container.viewContext)
        
        let result = recipeIngredient.saturates
        
        XCTAssertEqual(result, 0.0)
    }
    
    func test_RecipeIngredient_WhenIngredientIsNil_SugarsShouldBeZero() {
        let recipeIngredient = RecipeIngredient(context: persistenceController.container.viewContext)
        
        let result = recipeIngredient.sugars
        
        XCTAssertEqual(result, 0.0)
    }
    
    func test_Recipe_WhenIngredientIsNotNil_CaloriesShouldBeIngredientTimesQuantity() {
        let ingredient = Ingredient(context: persistenceController.container.viewContext)
        let recipeIngredient = RecipeIngredient(context: persistenceController.container.viewContext)
        
        ingredient.calories = 5
        recipeIngredient.ingredient = ingredient
        recipeIngredient.quantity = 4
        
        let result = recipeIngredient.calories
        
        XCTAssertEqual(result, 20)
    }
    
    func test_Recipe_WhenIngredientIsNotNil_CarbsShouldBeIngredientTimesQuantity() {
        let ingredient = Ingredient(context: persistenceController.container.viewContext)
        let recipeIngredient = RecipeIngredient(context: persistenceController.container.viewContext)
        
        ingredient.carbs = 5
        recipeIngredient.ingredient = ingredient
        recipeIngredient.quantity = 4
        
        let result = recipeIngredient.carbs
        
        XCTAssertEqual(result, 20.0)
    }
    
    func test_Recipe_WhenIngredientIsNotNil_FatShouldBeIngredientTimesQuantity() {
        let ingredient = Ingredient(context: persistenceController.container.viewContext)
        let recipeIngredient = RecipeIngredient(context: persistenceController.container.viewContext)
        
        ingredient.fat = 5
        recipeIngredient.ingredient = ingredient
        recipeIngredient.quantity = 4
        
        let result = recipeIngredient.fat
        
        XCTAssertEqual(result, 20.0)
    }
    
    func test_Recipe_WhenIngredientIsNotNil_FibreShouldBeIngredientTimesQuantity() {
        let ingredient = Ingredient(context: persistenceController.container.viewContext)
        let recipeIngredient = RecipeIngredient(context: persistenceController.container.viewContext)
        
        ingredient.fibre = 5
        recipeIngredient.ingredient = ingredient
        recipeIngredient.quantity = 4
        
        let result = recipeIngredient.fibre
        
        XCTAssertEqual(result, 20.0)
    }
    
    func test_Recipe_WhenIngredientIsNotNil_ProteinShouldBeIngredientTimesQuantity() {
        let ingredient = Ingredient(context: persistenceController.container.viewContext)
        let recipeIngredient = RecipeIngredient(context: persistenceController.container.viewContext)
        
        ingredient.protein = 5
        recipeIngredient.ingredient = ingredient
        recipeIngredient.quantity = 4
        
        let result = recipeIngredient.protein
        
        XCTAssertEqual(result, 20.0)
    }
    
    func test_Recipe_WhenIngredientIsNotNil_SaltShouldBeIngredientTimesQuantity() {
        let ingredient = Ingredient(context: persistenceController.container.viewContext)
        let recipeIngredient = RecipeIngredient(context: persistenceController.container.viewContext)
        
        ingredient.salt = 5
        recipeIngredient.ingredient = ingredient
        recipeIngredient.quantity = 4
        
        let result = recipeIngredient.salt
        
        XCTAssertEqual(result, 20.0)
    }
    
    func test_Recipe_WhenIngredientIsNotNil_SaturatesShouldBeIngredientTimesQuantity() {
        let ingredient = Ingredient(context: persistenceController.container.viewContext)
        let recipeIngredient = RecipeIngredient(context: persistenceController.container.viewContext)
        
        ingredient.saturates = 5
        recipeIngredient.ingredient = ingredient
        recipeIngredient.quantity = 4
        
        let result = recipeIngredient.saturates
        
        XCTAssertEqual(result, 20.0)
    }
    
    func test_Recipe_WhenIngredientIsNotNil_SugarsShouldBeIngredientTimesQuantity() {
        let ingredient = Ingredient(context: persistenceController.container.viewContext)
        let recipeIngredient = RecipeIngredient(context: persistenceController.container.viewContext)
        
        ingredient.sugars = 5
        recipeIngredient.ingredient = ingredient
        recipeIngredient.quantity = 4
        
        let result = recipeIngredient.sugars
        
        XCTAssertEqual(result, 20.0)
    }
}
