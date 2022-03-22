//
//  RecipeTests.swift
//  MealPlannerTests
//
//  Created by Joshua Rogers on 17/03/2022.
//

import XCTest
@testable import MealPlanner

class RecipeTests: XCTestCase {
    var persistenceController: PersistenceController!
    
    override func setUpWithError() throws {
        persistenceController = PersistenceController(inMemory: true)
    }

    override func tearDownWithError() throws {
        persistenceController = nil
    }
    
    func test_Recipe_WhenNameIsNotNil_WrappedNameShouldReturnName() {
        let recipe = Recipe(context: persistenceController.container.viewContext)
        let name = "test"
        
        recipe.name = name
        
        XCTAssertEqual(recipe.wrappedName, name)
    }
    
    func test_Recipe_WhenNameIsNil_WrappedNameShouldReturnUnknownName() {
        let recipe = Recipe(context: persistenceController.container.viewContext)
        
        XCTAssertEqual(recipe.wrappedName, "Unknown name")
    }
    
    func test_Recipe_WhenTagIsNotNil_WrappedTagShouldReturnTag() {
        let recipe = Recipe(context: persistenceController.container.viewContext)
        let tag = "test"
        
        recipe.tag = tag
        
        XCTAssertEqual(recipe.wrappedTag, tag)
    }
    
    func test_Recipe_WhenTagIsNil_WrappedTagShouldReturnUnknownTag() {
        let recipe = Recipe(context: persistenceController.container.viewContext)
        
        XCTAssertEqual(recipe.wrappedTag, "Unknown tag")
    }
    
    func test_Recipe_WhenCreated_IngredientsArrayShouldReturnEmptyArray() {
        let recipe = Recipe(context: persistenceController.container.viewContext)
        
        XCTAssertTrue(recipe.recipeIngredientsArray.isEmpty)
    }
    
    func test_Recipe_WhenCreated_InstructionsArrayShouldReturnEmptyArray() {
        let recipe = Recipe(context: persistenceController.container.viewContext)
        
        XCTAssertTrue(recipe.instructionsArray.isEmpty)
    }
    
    func test_Recipe_WhenCreated_MealPlanStagesArrayShouldReturnEmptyArray() {
        let recipe = Recipe(context: persistenceController.container.viewContext)
        
        XCTAssertTrue(recipe.mealPlanStagesArray.isEmpty)
    }
    
    func test_Recipe_WhenNoIngredients_CaloriesShouldBeZero() {
        let recipe = Recipe(context: persistenceController.container.viewContext)
        
        let result = recipe.calories
        
        XCTAssertEqual(result, 0)
    }
    
    func test_Recipe_WhenNoIngredients_CarbsShouldBeZero() {
        let recipe = Recipe(context: persistenceController.container.viewContext)
        
        let result = recipe.carbs
        
        XCTAssertEqual(result, 0.0)
    }
    
    func test_Recipe_WhenNoIngredients_FatShouldBeZero() {
        let recipe = Recipe(context: persistenceController.container.viewContext)
        
        let result = recipe.fat
        
        XCTAssertEqual(result, 0.0)
    }
    
    func test_Recipe_WhenNoIngredients_FibreShouldBeZero() {
        let recipe = Recipe(context: persistenceController.container.viewContext)
        
        let result = recipe.fibre
        
        XCTAssertEqual(result, 0.0)
    }
    
    func test_Recipe_WhenNoIngredients_ProteinShouldBeZero() {
        let recipe = Recipe(context: persistenceController.container.viewContext)
        
        let result = recipe.protein
        
        XCTAssertEqual(result, 0.0)
    }
    
    func test_Recipe_WhenNoIngredients_SaltShouldBeZero() {
        let recipe = Recipe(context: persistenceController.container.viewContext)
        
        let result = recipe.salt
        
        XCTAssertEqual(result, 0.0)
    }
    
    func test_Recipe_WhenNoIngredients_SaturatesShouldBeZero() {
        let recipe = Recipe(context: persistenceController.container.viewContext)
        
        let result = recipe.saturates
        
        XCTAssertEqual(result, 0.0)
    }
    
    func test_Recipe_WhenNoIngredients_SugarsShouldBeZero() {
        let recipe = Recipe(context: persistenceController.container.viewContext)
        
        let result = recipe.sugars
        
        XCTAssertEqual(result, 0.0)
    }
    
    func test_Recipe_WhenIngredients_CaloriesShouldBeTotalOfIngredients() {
        let recipe = Recipe(context: persistenceController.container.viewContext)
        let ingredient1 = Ingredient(context: persistenceController.container.viewContext)
        let ingredient2 = Ingredient(context: persistenceController.container.viewContext)
        let recipeIngredient1 = RecipeIngredient(context: persistenceController.container.viewContext)
        let recipeIngredient2 = RecipeIngredient(context: persistenceController.container.viewContext)
        
        ingredient1.calories = 5
        ingredient2.calories = 7
        recipeIngredient1.ingredient = ingredient1
        recipeIngredient2.ingredient = ingredient2
        
        recipe.addToRecipeIngredients(recipeIngredient1)
        recipe.addToRecipeIngredients(recipeIngredient2)
        let result = recipe.calories
        
        XCTAssertEqual(result, 12)
    }
    
    func test_Recipe_WhenIngredients_CarbsShouldBeTotalOfIngredients() {
        let recipe = Recipe(context: persistenceController.container.viewContext)
        let ingredient1 = Ingredient(context: persistenceController.container.viewContext)
        let ingredient2 = Ingredient(context: persistenceController.container.viewContext)
        let recipeIngredient1 = RecipeIngredient(context: persistenceController.container.viewContext)
        let recipeIngredient2 = RecipeIngredient(context: persistenceController.container.viewContext)
        
        ingredient1.carbs = 5.0
        ingredient2.carbs = 7.0
        recipeIngredient1.ingredient = ingredient1
        recipeIngredient2.ingredient = ingredient2
        
        recipe.addToRecipeIngredients(recipeIngredient1)
        recipe.addToRecipeIngredients(recipeIngredient2)
        let result = recipe.carbs
        
        XCTAssertEqual(result, 12.0)
    }
    
    func test_Recipe_WhenIngredients_FatShouldBeTotalOfIngredients() {
        let recipe = Recipe(context: persistenceController.container.viewContext)
        let ingredient1 = Ingredient(context: persistenceController.container.viewContext)
        let ingredient2 = Ingredient(context: persistenceController.container.viewContext)
        let recipeIngredient1 = RecipeIngredient(context: persistenceController.container.viewContext)
        let recipeIngredient2 = RecipeIngredient(context: persistenceController.container.viewContext)
        
        ingredient1.fat = 5.0
        ingredient2.fat = 7.0
        recipeIngredient1.ingredient = ingredient1
        recipeIngredient2.ingredient = ingredient2
        
        recipe.addToRecipeIngredients(recipeIngredient1)
        recipe.addToRecipeIngredients(recipeIngredient2)
        let result = recipe.fat
        
        XCTAssertEqual(result, 12.0)
    }
    
    func test_Recipe_WhenIngredients_FibreShouldBeTotalOfIngredients() {
        let recipe = Recipe(context: persistenceController.container.viewContext)
        let ingredient1 = Ingredient(context: persistenceController.container.viewContext)
        let ingredient2 = Ingredient(context: persistenceController.container.viewContext)
        let recipeIngredient1 = RecipeIngredient(context: persistenceController.container.viewContext)
        let recipeIngredient2 = RecipeIngredient(context: persistenceController.container.viewContext)
        
        ingredient1.fibre = 5.0
        ingredient2.fibre = 7.0
        recipeIngredient1.ingredient = ingredient1
        recipeIngredient2.ingredient = ingredient2
        
        recipe.addToRecipeIngredients(recipeIngredient1)
        recipe.addToRecipeIngredients(recipeIngredient2)
        let result = recipe.fibre
        
        XCTAssertEqual(result, 12.0)
    }
    
    func test_Recipe_WhenIngredients_ProteinShouldBeTotalOfIngredients() {
        let recipe = Recipe(context: persistenceController.container.viewContext)
        let ingredient1 = Ingredient(context: persistenceController.container.viewContext)
        let ingredient2 = Ingredient(context: persistenceController.container.viewContext)
        let recipeIngredient1 = RecipeIngredient(context: persistenceController.container.viewContext)
        let recipeIngredient2 = RecipeIngredient(context: persistenceController.container.viewContext)
        
        ingredient1.protein = 5.0
        ingredient2.protein = 7.0
        recipeIngredient1.ingredient = ingredient1
        recipeIngredient2.ingredient = ingredient2
        
        recipe.addToRecipeIngredients(recipeIngredient1)
        recipe.addToRecipeIngredients(recipeIngredient2)
        let result = recipe.protein
        
        XCTAssertEqual(result, 12.0)
    }
    
    func test_Recipe_WhenIngredients_SaltShouldBeTotalOfIngredients() {
        let recipe = Recipe(context: persistenceController.container.viewContext)
        let ingredient1 = Ingredient(context: persistenceController.container.viewContext)
        let ingredient2 = Ingredient(context: persistenceController.container.viewContext)
        let recipeIngredient1 = RecipeIngredient(context: persistenceController.container.viewContext)
        let recipeIngredient2 = RecipeIngredient(context: persistenceController.container.viewContext)
        
        ingredient1.salt = 5.0
        ingredient2.salt = 7.0
        recipeIngredient1.ingredient = ingredient1
        recipeIngredient2.ingredient = ingredient2
        
        recipe.addToRecipeIngredients(recipeIngredient1)
        recipe.addToRecipeIngredients(recipeIngredient2)
        let result = recipe.salt
        
        XCTAssertEqual(result, 12.0)
    }
    
    func test_Recipe_WhenIngredients_SaturatesShouldBeTotalOfIngredients() {
        let recipe = Recipe(context: persistenceController.container.viewContext)
        let ingredient1 = Ingredient(context: persistenceController.container.viewContext)
        let ingredient2 = Ingredient(context: persistenceController.container.viewContext)
        let recipeIngredient1 = RecipeIngredient(context: persistenceController.container.viewContext)
        let recipeIngredient2 = RecipeIngredient(context: persistenceController.container.viewContext)
        
        ingredient1.saturates = 5.0
        ingredient2.saturates = 7.0
        recipeIngredient1.ingredient = ingredient1
        recipeIngredient2.ingredient = ingredient2
        
        recipe.addToRecipeIngredients(recipeIngredient1)
        recipe.addToRecipeIngredients(recipeIngredient2)
        let result = recipe.saturates
        
        XCTAssertEqual(result, 12.0)
    }
    
    func test_Recipe_WhenIngredients_SugarsShouldBeTotalOfIngredients() {
        let recipe = Recipe(context: persistenceController.container.viewContext)
        let ingredient1 = Ingredient(context: persistenceController.container.viewContext)
        let ingredient2 = Ingredient(context: persistenceController.container.viewContext)
        let recipeIngredient1 = RecipeIngredient(context: persistenceController.container.viewContext)
        let recipeIngredient2 = RecipeIngredient(context: persistenceController.container.viewContext)
        
        ingredient1.sugars = 5.0
        ingredient2.sugars = 7.0
        recipeIngredient1.ingredient = ingredient1
        recipeIngredient2.ingredient = ingredient2
        
        recipe.addToRecipeIngredients(recipeIngredient1)
        recipe.addToRecipeIngredients(recipeIngredient2)
        let result = recipe.sugars
        
        XCTAssertEqual(result, 12.0)
    }
}
