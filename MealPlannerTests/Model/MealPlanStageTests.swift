//
//  MealPlanStageTests.swift
//  MealPlannerTests
//
//  Created by Joshua Rogers on 17/03/2022.
//

import XCTest
@testable import MealPlanner

class MealPlanStageTests: XCTestCase {
    var persistenceController: PersistenceController!
    
    override func setUpWithError() throws {
        persistenceController = PersistenceController(inMemory: true)
    }

    override func tearDownWithError() throws {
        persistenceController = nil
    }
    
    func test_MealPlanStage_WhenNameIsNotNil_WrappedNameShouldReturnName() {
        let stage = MealPlanStage(context: persistenceController.container.viewContext)
        let name = "test"
        
        stage.name = name
        
        XCTAssertEqual(stage.wrappedName, name)
    }
    
    func test_MealPlanStage_WhenNameIsNil_WrappedNameShouldReturnUnknownName() {
        let stage = MealPlanStage(context: persistenceController.container.viewContext)
        
        XCTAssertEqual(stage.wrappedName, "Unknown name")
    }
    
    func test_MealPlanStage_WhenCreated_RecipesArrayShouldReturnEmptyArray() {
        let stage = MealPlanStage(context: persistenceController.container.viewContext)
        
        XCTAssertTrue(stage.recipesArray.isEmpty)
    }
    
    func test_MealPlanStage_WhenNoRecipes_CaloriesShouldBeZero() {
        let mealPlanStage = MealPlanStage(context: persistenceController.container.viewContext)
        
        let result = mealPlanStage.calories
        
        XCTAssertEqual(result, 0)
    }
    
    func test_MealPlanStage_WhenNoRecipes_CarbsShouldBeZero() {
        let mealPlanStage = MealPlanStage(context: persistenceController.container.viewContext)
        
        let result = mealPlanStage.carbs
        
        XCTAssertEqual(result, 0)
    }
    
    func test_MealPlanStage_WhenNoRecipes_FatShouldBeZero() {
        let mealPlanStage = MealPlanStage(context: persistenceController.container.viewContext)
        
        let result = mealPlanStage.fat
        
        XCTAssertEqual(result, 0)
    }
    
    func test_MealPlanStage_WhenNoRecipes_FibreShouldBeZero() {
        let mealPlanStage = MealPlanStage(context: persistenceController.container.viewContext)
        
        let result = mealPlanStage.fibre
        
        XCTAssertEqual(result, 0)
    }
    
    func test_MealPlanStage_WhenNoRecipes_ProteinShouldBeZero() {
        let mealPlanStage = MealPlanStage(context: persistenceController.container.viewContext)
        
        let result = mealPlanStage.protein
        
        XCTAssertEqual(result, 0)
    }
    
    func test_MealPlanStage_WhenNoRecipes_SaltShouldBeZero() {
        let mealPlanStage = MealPlanStage(context: persistenceController.container.viewContext)
        
        let result = mealPlanStage.salt
        
        XCTAssertEqual(result, 0)
    }
    
    func test_MealPlanStage_WhenNoRecipes_SaturatesShouldBeZero() {
        let mealPlanStage = MealPlanStage(context: persistenceController.container.viewContext)
        
        let result = mealPlanStage.saturates
        
        XCTAssertEqual(result, 0)
    }
    
    func test_MealPlanStage_WhenNoRecipes_SugarsShouldBeZero() {
        let mealPlanStage = MealPlanStage(context: persistenceController.container.viewContext)
        
        let result = mealPlanStage.sugars
        
        XCTAssertEqual(result, 0)
    }
    
    func test_MealPlanStage_WhenRecipes_CaloriesShouldBeTotalOfRecipes() {
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
        let result = mealPlanStage.calories
        
        XCTAssertEqual(result, 24)
    }
    
    func test_MealPlanStage_WhenRecipes_CarbsShouldBeTotalOfRecipes() {
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
        let result = mealPlanStage.carbs
        
        XCTAssertEqual(result, 24.0)
    }
    
    func test_MealPlanStage_WhenRecipes_FatShouldBeTotalOfRecipes() {
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
        let result = mealPlanStage.fat
        
        XCTAssertEqual(result, 24.0)
    }
    
    func test_MealPlanStage_WhenRecipes_FibreShouldBeTotalOfRecipes() {
        let mealPlanStage = MealPlanStage(context: persistenceController.container.viewContext)
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
        recipeIngredient1.quantity = 2
        recipe.addToRecipeIngredients(recipeIngredient2)
        recipeIngredient2.quantity = 2
        mealPlanStage.addToRecipes(recipe)
        let result = mealPlanStage.fibre
        
        XCTAssertEqual(result, 24.0)
    }
    
    func test_MealPlanStage_WhenRecipes_ProteinShouldBeTotalOfRecipes() {
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
        let result = mealPlanStage.protein
        
        XCTAssertEqual(result, 24.0)
    }
    
    func test_MealPlanStage_WhenRecipes_SaltShouldBeTotalOfRecipes() {
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
        let result = mealPlanStage.salt
        
        XCTAssertEqual(result, 24.0)
    }
    
    func test_MealPlanStage_WhenRecipes_SaturatesShouldBeTotalOfRecipes() {
        let mealPlanStage = MealPlanStage(context: persistenceController.container.viewContext)
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
        recipeIngredient1.quantity = 2
        recipe.addToRecipeIngredients(recipeIngredient2)
        recipeIngredient2.quantity = 2
        mealPlanStage.addToRecipes(recipe)
        let result = mealPlanStage.saturates
        
        XCTAssertEqual(result, 24.0)
    }
    
    func test_MealPlanStage_WhenRecipes_SugarsShouldBeTotalOfRecipes() {
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
        let result = mealPlanStage.sugars
        
        XCTAssertEqual(result, 24.0)
    }
    
    func test_MealPlanStage_WhenNoRecipes_CaloriesPerPersonShouldBeZero() {
        let mealPlanStage = MealPlanStage(context: persistenceController.container.viewContext)
        
        let result = mealPlanStage.caloriesPerPerson
        
        XCTAssertEqual(result, 0.0)
    }
    
    func test_MealPlanStage_WhenNoRecipes_CarbsPerPersonShouldBeZero() {
        let mealPlanStage = MealPlanStage(context: persistenceController.container.viewContext)
        
        let result = mealPlanStage.carbsPerPerson
        
        XCTAssertEqual(result, 0.0)
    }
    
    func test_MealPlanStage_WhenNoRecipes_FatPerPersonShouldBeZero() {
        let mealPlanStage = MealPlanStage(context: persistenceController.container.viewContext)
        
        let result = mealPlanStage.fatPerPerson
        
        XCTAssertEqual(result, 0.0)
    }
    
    func test_MealPlanStage_WhenNoRecipes_FibrePerPersonShouldBeZero() {
        let mealPlanStage = MealPlanStage(context: persistenceController.container.viewContext)
        
        let result = mealPlanStage.fibrePerPerson
        
        XCTAssertEqual(result, 0.0)
    }
    
    func test_MealPlanStage_WhenNoRecipes_ProteinPerPersonShouldBeZero() {
        let mealPlanStage = MealPlanStage(context: persistenceController.container.viewContext)
        
        let result = mealPlanStage.proteinPerPerson
        
        XCTAssertEqual(result, 0.0)
    }
    
    func test_MealPlanStage_WhenNoRecipes_SaltPerPersonShouldBeZero() {
        let mealPlanStage = MealPlanStage(context: persistenceController.container.viewContext)
        
        let result = mealPlanStage.saltPerPerson
        
        XCTAssertEqual(result, 0.0)
    }
    
    func test_MealPlanStage_WhenNoRecipes_SaturatesPerPersonShouldBeZero() {
        let mealPlanStage = MealPlanStage(context: persistenceController.container.viewContext)
        
        let result = mealPlanStage.saturatesPerPerson
        
        XCTAssertEqual(result, 0.0)
    }
    
    func test_MealPlanStage_WhenNoRecipes_SugarsPerPersonShouldBeZero() {
        let mealPlanStage = MealPlanStage(context: persistenceController.container.viewContext)
        
        let result = mealPlanStage.sugarsPerPerson
        
        XCTAssertEqual(result, 0.0)
    }
    
    func test_MealPlanStage_WhenRecipes_CaloriesPerPersonShouldBeTotalOfRecipes() {
        let mealPlanStage = MealPlanStage(context: persistenceController.container.viewContext)
        let recipe = Recipe(context: persistenceController.container.viewContext)
        recipe.serves = 4
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
        let result = mealPlanStage.caloriesPerPerson
        
        XCTAssertEqual(result, (24.0 / 4.0))
    }
    
    func test_MealPlanStage_WhenRecipes_CarbsPerPersonShouldBeTotalOfRecipes() {
        let mealPlanStage = MealPlanStage(context: persistenceController.container.viewContext)
        let recipe = Recipe(context: persistenceController.container.viewContext)
        recipe.serves = 4
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
        let result = mealPlanStage.carbsPerPerson
        
        XCTAssertEqual(result, (24.0 / 4.0))
    }
    
    func test_MealPlanStage_WhenRecipes_FatPerPersonShouldBeTotalOfRecipes() {
        let mealPlanStage = MealPlanStage(context: persistenceController.container.viewContext)
        let recipe = Recipe(context: persistenceController.container.viewContext)
        recipe.serves = 4
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
        let result = mealPlanStage.fatPerPerson
        
        XCTAssertEqual(result, (24.0 / 4.0))
    }
    
    func test_MealPlanStage_WhenRecipes_FibrePerPersonShouldBeTotalOfRecipes() {
        let mealPlanStage = MealPlanStage(context: persistenceController.container.viewContext)
        let recipe = Recipe(context: persistenceController.container.viewContext)
        recipe.serves = 4
        let ingredient1 = Ingredient(context: persistenceController.container.viewContext)
        let ingredient2 = Ingredient(context: persistenceController.container.viewContext)
        let recipeIngredient1 = RecipeIngredient(context: persistenceController.container.viewContext)
        let recipeIngredient2 = RecipeIngredient(context: persistenceController.container.viewContext)
        
        ingredient1.fibre = 5.0
        ingredient2.fibre = 7.0
        recipeIngredient1.ingredient = ingredient1
        recipeIngredient2.ingredient = ingredient2
        
        recipe.addToRecipeIngredients(recipeIngredient1)
        recipeIngredient1.quantity = 2
        recipe.addToRecipeIngredients(recipeIngredient2)
        recipeIngredient2.quantity = 2
        mealPlanStage.addToRecipes(recipe)
        let result = mealPlanStage.fibrePerPerson
        
        XCTAssertEqual(result, (24.0 / 4.0))
    }
    
    func test_MealPlanStage_WhenRecipes_ProteinPerPersonShouldBeTotalOfRecipes() {
        let mealPlanStage = MealPlanStage(context: persistenceController.container.viewContext)
        let recipe = Recipe(context: persistenceController.container.viewContext)
        recipe.serves = 4
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
        let result = mealPlanStage.proteinPerPerson
        
        XCTAssertEqual(result, (24.0 / 4.0))
    }
    
    func test_MealPlanStage_WhenRecipes_SaltPerPersonShouldBeTotalOfRecipes() {
        let mealPlanStage = MealPlanStage(context: persistenceController.container.viewContext)
        let recipe = Recipe(context: persistenceController.container.viewContext)
        recipe.serves = 4
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
        let result = mealPlanStage.saltPerPerson
        
        XCTAssertEqual(result, (24.0 / 4.0))
    }
    
    func test_MealPlanStage_WhenRecipes_SaturatesPerPersonShouldBeTotalOfRecipes() {
        let mealPlanStage = MealPlanStage(context: persistenceController.container.viewContext)
        let recipe = Recipe(context: persistenceController.container.viewContext)
        recipe.serves = 4
        let ingredient1 = Ingredient(context: persistenceController.container.viewContext)
        let ingredient2 = Ingredient(context: persistenceController.container.viewContext)
        let recipeIngredient1 = RecipeIngredient(context: persistenceController.container.viewContext)
        let recipeIngredient2 = RecipeIngredient(context: persistenceController.container.viewContext)
        
        ingredient1.saturates = 5.0
        ingredient2.saturates = 7.0
        recipeIngredient1.ingredient = ingredient1
        recipeIngredient2.ingredient = ingredient2
        
        recipe.addToRecipeIngredients(recipeIngredient1)
        recipeIngredient1.quantity = 2
        recipe.addToRecipeIngredients(recipeIngredient2)
        recipeIngredient2.quantity = 2
        mealPlanStage.addToRecipes(recipe)
        let result = mealPlanStage.saturatesPerPerson
        
        XCTAssertEqual(result, (24.0 / 4.0))
    }
    
    func test_MealPlanStage_WhenRecipes_SugarsPerPersonShouldBeTotalOfRecipes() {
        let mealPlanStage = MealPlanStage(context: persistenceController.container.viewContext)
        let recipe = Recipe(context: persistenceController.container.viewContext)
        recipe.serves = 4
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
        let result = mealPlanStage.sugarsPerPerson
        
        XCTAssertEqual(result, (24.0 / 4.0))
    }
}
