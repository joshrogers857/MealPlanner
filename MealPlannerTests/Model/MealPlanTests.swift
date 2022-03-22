//
//  MealPlanTests.swift
//  MealPlannerTests
//
//  Created by Joshua Rogers on 17/03/2022.
//

import XCTest
@testable import MealPlanner

class MealPlanTests: XCTestCase {
    var persistenceController: PersistenceController!
    
    override func setUpWithError() throws {
        persistenceController = PersistenceController(inMemory: true)
    }

    override func tearDownWithError() throws {
        persistenceController = nil
    }
    
    func test_MealPlan_WhenDateIsNotNil_WrappedDateShouldReturnDate() {
        let mealPlan = MealPlan(context: persistenceController.container.viewContext)
        let date = Date.now
        
        mealPlan.date = date
        
        XCTAssertEqual(mealPlan.wrappedDate, date)
    }
    
    func test_MealPlan_WhenDateIsNil_WrappedDateShouldReturnUnixEpoch() {
        let mealPlan = MealPlan(context: persistenceController.container.viewContext)
        
        XCTAssertEqual(mealPlan.wrappedDate, Date(timeIntervalSince1970: 0))
    }
    
    func test_MealPlan_WhenCreated_StagesArrayShouldReturnEmptyArray() {
        let mealPlan = MealPlan(context: persistenceController.container.viewContext)
        
        XCTAssertTrue(mealPlan.stagesArray.isEmpty)
    }
    
    func test_MealPlan_WhenNoStages_CaloriesShouldBeZero() {
        let mealPlan = MealPlan(context: persistenceController.container.viewContext)
        
        let result = mealPlan.calories
        
        XCTAssertEqual(result, 0)
    }
    
    func test_MealPlan_WhenNoStages_CarbsShouldBeZero() {
        let mealPlan = MealPlan(context: persistenceController.container.viewContext)
        
        let result = mealPlan.carbs
        
        XCTAssertEqual(result, 0)
    }
    
    func test_MealPlan_WhenNoStages_FatShouldBeZero() {
        let mealPlan = MealPlan(context: persistenceController.container.viewContext)
        
        let result = mealPlan.fat
        
        XCTAssertEqual(result, 0)
    }
    
    func test_MealPlan_WhenNoStages_FibreShouldBeZero() {
        let mealPlan = MealPlan(context: persistenceController.container.viewContext)
        
        let result = mealPlan.fibre
        
        XCTAssertEqual(result, 0)
    }
    
    func test_MealPlan_WhenNoStages_ProteinShouldBeZero() {
        let mealPlan = MealPlan(context: persistenceController.container.viewContext)
        
        let result = mealPlan.protein
        
        XCTAssertEqual(result, 0)
    }
    
    func test_MealPlan_WhenNoStages_SaltShouldBeZero() {
        let mealPlan = MealPlan(context: persistenceController.container.viewContext)
        
        let result = mealPlan.salt
        
        XCTAssertEqual(result, 0)
    }
    
    func test_MealPlan_WhenNoStages_SaturatesShouldBeZero() {
        let mealPlan = MealPlan(context: persistenceController.container.viewContext)
        
        let result = mealPlan.saturates
        
        XCTAssertEqual(result, 0)
    }
    
    func test_MealPlan_WhenNoStages_SugarsShouldBeZero() {
        let mealPlan = MealPlan(context: persistenceController.container.viewContext)
        
        let result = mealPlan.sugars
        
        XCTAssertEqual(result, 0)
    }
    
    func test_MealPlan_WhenStages_CaloriesShouldBeTotalOfStages() {
        let mealPlan = MealPlan(context: persistenceController.container.viewContext)
        let mealPlanStage = MealPlanStage(context: persistenceController.container.viewContext)
        let recipe = Recipe(context: persistenceController.container.viewContext)
        let ingredient1 = Ingredient(context: persistenceController.container.viewContext)
        let ingredient2 = Ingredient(context: persistenceController.container.viewContext)
        let recipeIngredient1 = RecipeIngredient(context: persistenceController.container.viewContext)
        let recipeIngredient2 = RecipeIngredient(context: persistenceController.container.viewContext)
        
        ingredient1.calories = 5
        ingredient2.calories = 7
        recipeIngredient1.ingredient = ingredient1
        recipeIngredient1.quantity = 2
        recipeIngredient2.ingredient = ingredient2
        recipeIngredient2.quantity = 2
        
        recipe.addToRecipeIngredients(recipeIngredient1)
        recipe.addToRecipeIngredients(recipeIngredient2)
        mealPlanStage.addToRecipes(recipe)
        mealPlan.addToStages(mealPlanStage)
        let result = mealPlan.calories
        
        XCTAssertEqual(result, 24)
    }
    
    func test_MealPlan_WhenStages_CarbsShouldBeTotalOfStages() {
        let mealPlan = MealPlan(context: persistenceController.container.viewContext)
        let mealPlanStage = MealPlanStage(context: persistenceController.container.viewContext)
        let recipe = Recipe(context: persistenceController.container.viewContext)
        let ingredient1 = Ingredient(context: persistenceController.container.viewContext)
        let ingredient2 = Ingredient(context: persistenceController.container.viewContext)
        let recipeIngredient1 = RecipeIngredient(context: persistenceController.container.viewContext)
        let recipeIngredient2 = RecipeIngredient(context: persistenceController.container.viewContext)
        
        ingredient1.carbs = 5.0
        ingredient2.carbs = 7.0
        recipeIngredient1.ingredient = ingredient1
        recipeIngredient1.quantity = 2
        recipeIngredient2.ingredient = ingredient2
        recipeIngredient2.quantity = 2
        
        recipe.addToRecipeIngredients(recipeIngredient1)
        recipe.addToRecipeIngredients(recipeIngredient2)
        mealPlanStage.addToRecipes(recipe)
        mealPlan.addToStages(mealPlanStage)
        let result = mealPlan.carbs
        
        XCTAssertEqual(result, 24.0)
    }
    
    func test_MealPlan_WhenStages_FatShouldBeTotalOfStages() {
        let mealPlan = MealPlan(context: persistenceController.container.viewContext)
        let mealPlanStage = MealPlanStage(context: persistenceController.container.viewContext)
        let recipe = Recipe(context: persistenceController.container.viewContext)
        let ingredient1 = Ingredient(context: persistenceController.container.viewContext)
        let ingredient2 = Ingredient(context: persistenceController.container.viewContext)
        let recipeIngredient1 = RecipeIngredient(context: persistenceController.container.viewContext)
        let recipeIngredient2 = RecipeIngredient(context: persistenceController.container.viewContext)
        
        ingredient1.fat = 5.0
        ingredient2.fat = 7.0
        recipeIngredient1.ingredient = ingredient1
        recipeIngredient1.quantity = 2
        recipeIngredient2.ingredient = ingredient2
        recipeIngredient2.quantity = 2
        
        recipe.addToRecipeIngredients(recipeIngredient1)
        recipe.addToRecipeIngredients(recipeIngredient2)
        mealPlanStage.addToRecipes(recipe)
        mealPlan.addToStages(mealPlanStage)
        let result = mealPlan.fat
        
        XCTAssertEqual(result, 24.0)
    }
    
    func test_MealPlan_WhenStages_FibreShouldBeTotalOfStages() {
        let mealPlan = MealPlan(context: persistenceController.container.viewContext)
        let mealPlanStage = MealPlanStage(context: persistenceController.container.viewContext)
        let recipe = Recipe(context: persistenceController.container.viewContext)
        let ingredient1 = Ingredient(context: persistenceController.container.viewContext)
        let ingredient2 = Ingredient(context: persistenceController.container.viewContext)
        let recipeIngredient1 = RecipeIngredient(context: persistenceController.container.viewContext)
        let recipeIngredient2 = RecipeIngredient(context: persistenceController.container.viewContext)
        
        ingredient1.fibre = 5.0
        ingredient2.fibre = 7.0
        recipeIngredient1.ingredient = ingredient1
        recipeIngredient1.quantity = 2
        recipeIngredient2.ingredient = ingredient2
        recipeIngredient2.quantity = 2
        
        recipe.addToRecipeIngredients(recipeIngredient1)
        recipe.addToRecipeIngredients(recipeIngredient2)
        mealPlanStage.addToRecipes(recipe)
        mealPlan.addToStages(mealPlanStage)
        let result = mealPlan.fibre
        
        XCTAssertEqual(result, 24.0)
    }
    
    func test_MealPlan_WhenStages_ProteinShouldBeTotalOfStages() {
        let mealPlan = MealPlan(context: persistenceController.container.viewContext)
        let mealPlanStage = MealPlanStage(context: persistenceController.container.viewContext)
        let recipe = Recipe(context: persistenceController.container.viewContext)
        let ingredient1 = Ingredient(context: persistenceController.container.viewContext)
        let ingredient2 = Ingredient(context: persistenceController.container.viewContext)
        let recipeIngredient1 = RecipeIngredient(context: persistenceController.container.viewContext)
        let recipeIngredient2 = RecipeIngredient(context: persistenceController.container.viewContext)
        
        ingredient1.protein = 5.0
        ingredient2.protein = 7.0
        recipeIngredient1.ingredient = ingredient1
        recipeIngredient1.quantity = 2
        recipeIngredient2.ingredient = ingredient2
        recipeIngredient2.quantity = 2
        
        recipe.addToRecipeIngredients(recipeIngredient1)
        recipe.addToRecipeIngredients(recipeIngredient2)
        mealPlanStage.addToRecipes(recipe)
        mealPlan.addToStages(mealPlanStage)
        let result = mealPlan.protein
        
        XCTAssertEqual(result, 24.0)
    }
    
    func test_MealPlan_WhenStages_SaltShouldBeTotalOfStages() {
        let mealPlan = MealPlan(context: persistenceController.container.viewContext)
        let mealPlanStage = MealPlanStage(context: persistenceController.container.viewContext)
        let recipe = Recipe(context: persistenceController.container.viewContext)
        let ingredient1 = Ingredient(context: persistenceController.container.viewContext)
        let ingredient2 = Ingredient(context: persistenceController.container.viewContext)
        let recipeIngredient1 = RecipeIngredient(context: persistenceController.container.viewContext)
        let recipeIngredient2 = RecipeIngredient(context: persistenceController.container.viewContext)
        
        ingredient1.salt = 5.0
        ingredient2.salt = 7.0
        recipeIngredient1.ingredient = ingredient1
        recipeIngredient1.quantity = 2
        recipeIngredient2.ingredient = ingredient2
        recipeIngredient2.quantity = 2
        
        recipe.addToRecipeIngredients(recipeIngredient1)
        recipe.addToRecipeIngredients(recipeIngredient2)
        mealPlanStage.addToRecipes(recipe)
        mealPlan.addToStages(mealPlanStage)
        let result = mealPlan.salt
        
        XCTAssertEqual(result, 24.0)
    }
    
    func test_MealPlan_WhenStages_SaturatesShouldBeTotalOfStages() {
        let mealPlan = MealPlan(context: persistenceController.container.viewContext)
        let mealPlanStage = MealPlanStage(context: persistenceController.container.viewContext)
        let recipe = Recipe(context: persistenceController.container.viewContext)
        let ingredient1 = Ingredient(context: persistenceController.container.viewContext)
        let ingredient2 = Ingredient(context: persistenceController.container.viewContext)
        let recipeIngredient1 = RecipeIngredient(context: persistenceController.container.viewContext)
        let recipeIngredient2 = RecipeIngredient(context: persistenceController.container.viewContext)
        
        ingredient1.saturates = 5.0
        ingredient2.saturates = 7.0
        recipeIngredient1.ingredient = ingredient1
        recipeIngredient1.quantity = 2
        recipeIngredient2.ingredient = ingredient2
        recipeIngredient2.quantity = 2
        
        recipe.addToRecipeIngredients(recipeIngredient1)
        recipe.addToRecipeIngredients(recipeIngredient2)
        mealPlanStage.addToRecipes(recipe)
        mealPlan.addToStages(mealPlanStage)
        let result = mealPlan.saturates
        
        XCTAssertEqual(result, 24.0)
    }
    
    func test_MealPlan_WhenStages_SugarsShouldBeTotalOfStages() {
        let mealPlan = MealPlan(context: persistenceController.container.viewContext)
        let mealPlanStage = MealPlanStage(context: persistenceController.container.viewContext)
        let recipe = Recipe(context: persistenceController.container.viewContext)
        let ingredient1 = Ingredient(context: persistenceController.container.viewContext)
        let ingredient2 = Ingredient(context: persistenceController.container.viewContext)
        let recipeIngredient1 = RecipeIngredient(context: persistenceController.container.viewContext)
        let recipeIngredient2 = RecipeIngredient(context: persistenceController.container.viewContext)
        
        ingredient1.sugars = 5.0
        ingredient2.sugars = 7.0
        recipeIngredient1.ingredient = ingredient1
        recipeIngredient1.quantity = 2
        recipeIngredient2.ingredient = ingredient2
        recipeIngredient2.quantity = 2
        
        recipe.addToRecipeIngredients(recipeIngredient1)
        recipe.addToRecipeIngredients(recipeIngredient2)
        mealPlanStage.addToRecipes(recipe)
        mealPlan.addToStages(mealPlanStage)
        let result = mealPlan.sugars
        
        XCTAssertEqual(result, 24.0)
    }
}
