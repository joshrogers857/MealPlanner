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
        recipeIngredient1.quantity = 2
        recipeIngredient2.ingredient = ingredient2
        recipeIngredient2.quantity = 2
        
        recipe.addToRecipeIngredients(recipeIngredient1)
        recipe.addToRecipeIngredients(recipeIngredient2)
        let result = recipe.calories
        
        XCTAssertEqual(result, 24)
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
        recipeIngredient1.quantity = 2
        recipeIngredient2.ingredient = ingredient2
        recipeIngredient2.quantity = 2
        
        recipe.addToRecipeIngredients(recipeIngredient1)
        recipe.addToRecipeIngredients(recipeIngredient2)
        let result = recipe.carbs
        
        XCTAssertEqual(result, 24.0)
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
        recipeIngredient1.quantity = 2
        recipeIngredient2.ingredient = ingredient2
        recipeIngredient2.quantity = 2
        
        recipe.addToRecipeIngredients(recipeIngredient1)
        recipe.addToRecipeIngredients(recipeIngredient2)
        let result = recipe.fat
        
        XCTAssertEqual(result, 24.0)
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
        recipeIngredient1.quantity = 2
        recipeIngredient2.ingredient = ingredient2
        recipeIngredient2.quantity = 2
        
        recipe.addToRecipeIngredients(recipeIngredient1)
        recipe.addToRecipeIngredients(recipeIngredient2)
        let result = recipe.fibre
        
        XCTAssertEqual(result, 24.0)
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
        recipeIngredient1.quantity = 2
        recipeIngredient2.ingredient = ingredient2
        recipeIngredient2.quantity = 2
        
        recipe.addToRecipeIngredients(recipeIngredient1)
        recipe.addToRecipeIngredients(recipeIngredient2)
        let result = recipe.protein
        
        XCTAssertEqual(result, 24.0)
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
        recipeIngredient1.quantity = 2
        recipeIngredient2.ingredient = ingredient2
        recipeIngredient2.quantity = 2
        
        recipe.addToRecipeIngredients(recipeIngredient1)
        recipe.addToRecipeIngredients(recipeIngredient2)
        let result = recipe.salt
        
        XCTAssertEqual(result, 24.0)
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
        recipeIngredient1.quantity = 2
        recipeIngredient2.ingredient = ingredient2
        recipeIngredient2.quantity = 2
        
        recipe.addToRecipeIngredients(recipeIngredient1)
        recipe.addToRecipeIngredients(recipeIngredient2)
        let result = recipe.saturates
        
        XCTAssertEqual(result, 24.0)
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
        recipeIngredient1.quantity = 2
        recipeIngredient2.ingredient = ingredient2
        recipeIngredient2.quantity = 2
        
        recipe.addToRecipeIngredients(recipeIngredient1)
        recipe.addToRecipeIngredients(recipeIngredient2)
        let result = recipe.sugars
        
        XCTAssertEqual(result, 24.0)
    }
    
    func test_Recipe_WhenNoIngredientsAndServesIsSet_CaloriesPerPersonShouldBeZero() {
        let recipe = Recipe(context: persistenceController.container.viewContext)
        recipe.serves = 1
        
        let result = recipe.caloriesPerPerson
        
        XCTAssertEqual(result, 0)
    }
    
    func test_Recipe_WhenNoIngredientsAndServesIsSet_CarbsPerPersonShouldBeZero() {
        let recipe = Recipe(context: persistenceController.container.viewContext)
        recipe.serves = 1
        
        let result = recipe.carbsPerPerson
        
        XCTAssertEqual(result, 0.0)
    }
    
    func test_Recipe_WhenNoIngredientsAndServesIsSet_FatPerPersonShouldBeZero() {
        let recipe = Recipe(context: persistenceController.container.viewContext)
        recipe.serves = 1
        
        let result = recipe.fatPerPerson
        
        XCTAssertEqual(result, 0.0)
    }
    
    func test_Recipe_WhenNoIngredientsAndServesIsSet_FibrePerPersonShouldBeZero() {
        let recipe = Recipe(context: persistenceController.container.viewContext)
        recipe.serves = 1
        
        let result = recipe.fibrePerPerson
        
        XCTAssertEqual(result, 0.0)
    }
    
    func test_Recipe_WhenNoIngredientsAndServesIsSet_ProteinPerPersonShouldBeZero() {
        let recipe = Recipe(context: persistenceController.container.viewContext)
        recipe.serves = 1
        
        let result = recipe.proteinPerPerson
        
        XCTAssertEqual(result, 0.0)
    }
    
    func test_Recipe_WhenNoIngredientsAndServesIsSet_SaltPerPersonShouldBeZero() {
        let recipe = Recipe(context: persistenceController.container.viewContext)
        recipe.serves = 1
        
        let result = recipe.saltPerPerson
        
        XCTAssertEqual(result, 0.0)
    }
    
    func test_Recipe_WhenNoIngredientsAndServesIsSet_SaturatesPerPersonShouldBeZero() {
        let recipe = Recipe(context: persistenceController.container.viewContext)
        recipe.serves = 1
        
        let result = recipe.saturatesPerPerson
        
        XCTAssertEqual(result, 0.0)
    }
    
    func test_Recipe_WhenNoIngredientsAndServesIsSet_SugarsPerPersonShouldBeZero() {
        let recipe = Recipe(context: persistenceController.container.viewContext)
        recipe.serves = 1
        
        let result = recipe.sugarsPerPerson
        
        XCTAssertEqual(result, 0.0)
    }
    
    func test_Recipe_WhenNoIngredientsAndServesIsNotSet_CaloriesPerPersonShouldBeNan() {
        let recipe = Recipe(context: persistenceController.container.viewContext)
        
        let result = recipe.caloriesPerPerson
        
        XCTAssertTrue(result.isNaN)
    }
    
    func test_Recipe_WhenNoIngredientsAndServesIsNotSet_CarbsPerPersonShouldBeNan() {
        let recipe = Recipe(context: persistenceController.container.viewContext)
        
        let result = recipe.carbsPerPerson
        
        XCTAssertTrue(result.isNaN)
    }
    
    func test_Recipe_WhenNoIngredientsAndServesIsNotSet_FatPerPersonShouldBeNan() {
        let recipe = Recipe(context: persistenceController.container.viewContext)
        
        let result = recipe.fatPerPerson
        
        XCTAssertTrue(result.isNaN)
    }
    
    func test_Recipe_WhenNoIngredientsAndServesIsNotSet_FibrePerPersonShouldBeNan() {
        let recipe = Recipe(context: persistenceController.container.viewContext)
        
        let result = recipe.fibrePerPerson
        
        XCTAssertTrue(result.isNaN)
    }
    
    func test_Recipe_WhenNoIngredientsAndServesIsNotSet_ProteinPerPersonShouldBeNan() {
        let recipe = Recipe(context: persistenceController.container.viewContext)
        
        let result = recipe.proteinPerPerson
        
        XCTAssertTrue(result.isNaN)
    }
    
    func test_Recipe_WhenNoIngredientsAndServesIsNotSet_SaltPerPersonShouldBeNan() {
        let recipe = Recipe(context: persistenceController.container.viewContext)
        
        let result = recipe.saltPerPerson
        
        XCTAssertTrue(result.isNaN)
    }
    
    func test_Recipe_WhenNoIngredientsAndServesIsNotSet_SaturatesPerPersonShouldBeNan() {
        let recipe = Recipe(context: persistenceController.container.viewContext)
        
        let result = recipe.saturatesPerPerson
        
        XCTAssertTrue(result.isNaN)
    }
    
    func test_Recipe_WhenNoIngredientsAndServesIsNotSet_SugarsPerPersonShouldBeNan() {
        let recipe = Recipe(context: persistenceController.container.viewContext)
        
        let result = recipe.sugarsPerPerson
        
        XCTAssertTrue(result.isNaN)
    }
    
    func test_Recipe_WhenIngredientsAndServesIsNotSet_CaloriesPerPersonShouldBeInf() {
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
        
        let result = recipe.caloriesPerPerson
        
        XCTAssertTrue(result.isInfinite)
    }
    
    func test_Recipe_WhenIngredientsAndServesIsNotSet_CarbsPerPersonShouldBeInf() {
        let recipe = Recipe(context: persistenceController.container.viewContext)
        let ingredient1 = Ingredient(context: persistenceController.container.viewContext)
        let ingredient2 = Ingredient(context: persistenceController.container.viewContext)
        let recipeIngredient1 = RecipeIngredient(context: persistenceController.container.viewContext)
        let recipeIngredient2 = RecipeIngredient(context: persistenceController.container.viewContext)
        
        ingredient1.carbs = 5
        ingredient2.carbs = 7
        recipeIngredient1.ingredient = ingredient1
        recipeIngredient1.quantity = 2
        recipeIngredient2.ingredient = ingredient2
        recipeIngredient2.quantity = 2
        
        recipe.addToRecipeIngredients(recipeIngredient1)
        recipe.addToRecipeIngredients(recipeIngredient2)
        
        let result = recipe.carbsPerPerson
        
        XCTAssertTrue(result.isInfinite)
    }
    
    func test_Recipe_WhenIngredientsAndServesIsNotSet_FatPerPersonShouldBeInf() {
        let recipe = Recipe(context: persistenceController.container.viewContext)
        let ingredient1 = Ingredient(context: persistenceController.container.viewContext)
        let ingredient2 = Ingredient(context: persistenceController.container.viewContext)
        let recipeIngredient1 = RecipeIngredient(context: persistenceController.container.viewContext)
        let recipeIngredient2 = RecipeIngredient(context: persistenceController.container.viewContext)
        
        ingredient1.fat = 5
        ingredient2.fat = 7
        recipeIngredient1.ingredient = ingredient1
        recipeIngredient1.quantity = 2
        recipeIngredient2.ingredient = ingredient2
        recipeIngredient2.quantity = 2
        
        recipe.addToRecipeIngredients(recipeIngredient1)
        recipe.addToRecipeIngredients(recipeIngredient2)
        
        let result = recipe.fatPerPerson
        
        XCTAssertTrue(result.isInfinite)
    }
    
    func test_Recipe_WhenIngredientsAndServesIsNotSet_FibrePerPersonShouldBeInf() {
        let recipe = Recipe(context: persistenceController.container.viewContext)
        let ingredient1 = Ingredient(context: persistenceController.container.viewContext)
        let ingredient2 = Ingredient(context: persistenceController.container.viewContext)
        let recipeIngredient1 = RecipeIngredient(context: persistenceController.container.viewContext)
        let recipeIngredient2 = RecipeIngredient(context: persistenceController.container.viewContext)
        
        ingredient1.fibre = 5
        ingredient2.fibre = 7
        recipeIngredient1.ingredient = ingredient1
        recipeIngredient1.quantity = 2
        recipeIngredient2.ingredient = ingredient2
        recipeIngredient2.quantity = 2
        
        recipe.addToRecipeIngredients(recipeIngredient1)
        recipe.addToRecipeIngredients(recipeIngredient2)
        
        let result = recipe.fibrePerPerson
        
        XCTAssertTrue(result.isInfinite)
    }
    
    func test_Recipe_WhenIngredientsAndServesIsNotSet_ProteinPerPersonShouldBeInf() {
        let recipe = Recipe(context: persistenceController.container.viewContext)
        let ingredient1 = Ingredient(context: persistenceController.container.viewContext)
        let ingredient2 = Ingredient(context: persistenceController.container.viewContext)
        let recipeIngredient1 = RecipeIngredient(context: persistenceController.container.viewContext)
        let recipeIngredient2 = RecipeIngredient(context: persistenceController.container.viewContext)
        
        ingredient1.protein = 5
        ingredient2.protein = 7
        recipeIngredient1.ingredient = ingredient1
        recipeIngredient1.quantity = 2
        recipeIngredient2.ingredient = ingredient2
        recipeIngredient2.quantity = 2
        
        recipe.addToRecipeIngredients(recipeIngredient1)
        recipe.addToRecipeIngredients(recipeIngredient2)
        
        let result = recipe.proteinPerPerson
        
        XCTAssertTrue(result.isInfinite)
    }
    
    func test_Recipe_WhenIngredientsAndServesIsNotSet_SaltPerPersonShouldBeInf() {
        let recipe = Recipe(context: persistenceController.container.viewContext)
        let ingredient1 = Ingredient(context: persistenceController.container.viewContext)
        let ingredient2 = Ingredient(context: persistenceController.container.viewContext)
        let recipeIngredient1 = RecipeIngredient(context: persistenceController.container.viewContext)
        let recipeIngredient2 = RecipeIngredient(context: persistenceController.container.viewContext)
        
        ingredient1.salt = 5
        ingredient2.salt = 7
        recipeIngredient1.ingredient = ingredient1
        recipeIngredient1.quantity = 2
        recipeIngredient2.ingredient = ingredient2
        recipeIngredient2.quantity = 2
        
        recipe.addToRecipeIngredients(recipeIngredient1)
        recipe.addToRecipeIngredients(recipeIngredient2)
        
        let result = recipe.saltPerPerson
        
        XCTAssertTrue(result.isInfinite)
    }
    
    func test_Recipe_WhenIngredientsAndServesIsNotSet_SaturatesPerPersonShouldBeInf() {
        let recipe = Recipe(context: persistenceController.container.viewContext)
        let ingredient1 = Ingredient(context: persistenceController.container.viewContext)
        let ingredient2 = Ingredient(context: persistenceController.container.viewContext)
        let recipeIngredient1 = RecipeIngredient(context: persistenceController.container.viewContext)
        let recipeIngredient2 = RecipeIngredient(context: persistenceController.container.viewContext)
        
        ingredient1.saturates = 5
        ingredient2.saturates = 7
        recipeIngredient1.ingredient = ingredient1
        recipeIngredient1.quantity = 2
        recipeIngredient2.ingredient = ingredient2
        recipeIngredient2.quantity = 2
        
        recipe.addToRecipeIngredients(recipeIngredient1)
        recipe.addToRecipeIngredients(recipeIngredient2)
        
        let result = recipe.saturatesPerPerson
        
        XCTAssertTrue(result.isInfinite)
    }
    
    func test_Recipe_WhenIngredientsAndServesIsNotSet_SugarsPerPersonShouldBeInf() {
        let recipe = Recipe(context: persistenceController.container.viewContext)
        let ingredient1 = Ingredient(context: persistenceController.container.viewContext)
        let ingredient2 = Ingredient(context: persistenceController.container.viewContext)
        let recipeIngredient1 = RecipeIngredient(context: persistenceController.container.viewContext)
        let recipeIngredient2 = RecipeIngredient(context: persistenceController.container.viewContext)
        
        ingredient1.sugars = 5
        ingredient2.sugars = 7
        recipeIngredient1.ingredient = ingredient1
        recipeIngredient1.quantity = 2
        recipeIngredient2.ingredient = ingredient2
        recipeIngredient2.quantity = 2
        
        recipe.addToRecipeIngredients(recipeIngredient1)
        recipe.addToRecipeIngredients(recipeIngredient2)
        
        let result = recipe.sugarsPerPerson
        
        XCTAssertTrue(result.isInfinite)
    }
    
    
    
    
    
    func test_Recipe_WhenIngredientsAndServesIsSetTo4_CaloriesPerPersonShouldBeAQuarterOfCalories() {
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
        
        let result1 = recipe.calories
        let result2 = recipe.caloriesPerPerson
        
        XCTAssertEqual(Double(result1 / 4), result2)
    }
    
    func test_Recipe_WhenIngredientsAndServesIsSetTo4_CarbsPerPersonShouldBeAQuarterOfCarbs() {
        let recipe = Recipe(context: persistenceController.container.viewContext)
        recipe.serves = 4
        
        let ingredient1 = Ingredient(context: persistenceController.container.viewContext)
        let ingredient2 = Ingredient(context: persistenceController.container.viewContext)
        let recipeIngredient1 = RecipeIngredient(context: persistenceController.container.viewContext)
        let recipeIngredient2 = RecipeIngredient(context: persistenceController.container.viewContext)
        
        ingredient1.carbs = 5
        ingredient2.carbs = 7
        recipeIngredient1.ingredient = ingredient1
        recipeIngredient1.quantity = 2
        recipeIngredient2.ingredient = ingredient2
        recipeIngredient2.quantity = 2
        
        recipe.addToRecipeIngredients(recipeIngredient1)
        recipe.addToRecipeIngredients(recipeIngredient2)
        
        let result1 = recipe.carbs
        let result2 = recipe.carbsPerPerson
        
        XCTAssertEqual(Double(result1 / 4), result2)
    }
    
    func test_Recipe_WhenIngredientsAndServesIsSetTo4_FatPerPersonShouldBeAQuarterOfFat() {
        let recipe = Recipe(context: persistenceController.container.viewContext)
        recipe.serves = 4
        
        let ingredient1 = Ingredient(context: persistenceController.container.viewContext)
        let ingredient2 = Ingredient(context: persistenceController.container.viewContext)
        let recipeIngredient1 = RecipeIngredient(context: persistenceController.container.viewContext)
        let recipeIngredient2 = RecipeIngredient(context: persistenceController.container.viewContext)
        
        ingredient1.fat = 5
        ingredient2.fat = 7
        recipeIngredient1.ingredient = ingredient1
        recipeIngredient1.quantity = 2
        recipeIngredient2.ingredient = ingredient2
        recipeIngredient2.quantity = 2
        
        recipe.addToRecipeIngredients(recipeIngredient1)
        recipe.addToRecipeIngredients(recipeIngredient2)
        
        let result1 = recipe.fat
        let result2 = recipe.fatPerPerson
        
        XCTAssertEqual(Double(result1 / 4), result2)
    }
    
    func test_Recipe_WhenIngredientsAndServesIsSetTo4_FibrePerPersonShouldBeAQuarterOfFibre() {
        let recipe = Recipe(context: persistenceController.container.viewContext)
        recipe.serves = 4
        
        let ingredient1 = Ingredient(context: persistenceController.container.viewContext)
        let ingredient2 = Ingredient(context: persistenceController.container.viewContext)
        let recipeIngredient1 = RecipeIngredient(context: persistenceController.container.viewContext)
        let recipeIngredient2 = RecipeIngredient(context: persistenceController.container.viewContext)
        
        ingredient1.fibre = 5
        ingredient2.fibre = 7
        recipeIngredient1.ingredient = ingredient1
        recipeIngredient1.quantity = 2
        recipeIngredient2.ingredient = ingredient2
        recipeIngredient2.quantity = 2
        
        recipe.addToRecipeIngredients(recipeIngredient1)
        recipe.addToRecipeIngredients(recipeIngredient2)
        
        let result1 = recipe.fibre
        let result2 = recipe.fibrePerPerson
        
        XCTAssertEqual(Double(result1 / 4), result2)
    }
    
    func test_Recipe_WhenIngredientsAndServesIsSetTo4_ProteinPerPersonShouldBeAQuarterOfProtein() {
        let recipe = Recipe(context: persistenceController.container.viewContext)
        recipe.serves = 4
        
        let ingredient1 = Ingredient(context: persistenceController.container.viewContext)
        let ingredient2 = Ingredient(context: persistenceController.container.viewContext)
        let recipeIngredient1 = RecipeIngredient(context: persistenceController.container.viewContext)
        let recipeIngredient2 = RecipeIngredient(context: persistenceController.container.viewContext)
        
        ingredient1.protein = 5
        ingredient2.protein = 7
        recipeIngredient1.ingredient = ingredient1
        recipeIngredient1.quantity = 2
        recipeIngredient2.ingredient = ingredient2
        recipeIngredient2.quantity = 2
        
        recipe.addToRecipeIngredients(recipeIngredient1)
        recipe.addToRecipeIngredients(recipeIngredient2)
        
        let result1 = recipe.protein
        let result2 = recipe.proteinPerPerson
        
        XCTAssertEqual(Double(result1 / 4), result2)
    }
    
    func test_Recipe_WhenIngredientsAndServesIsSetTo4_SaltPerPersonShouldBeAQuarterOfSalt() {
        let recipe = Recipe(context: persistenceController.container.viewContext)
        recipe.serves = 4
        
        let ingredient1 = Ingredient(context: persistenceController.container.viewContext)
        let ingredient2 = Ingredient(context: persistenceController.container.viewContext)
        let recipeIngredient1 = RecipeIngredient(context: persistenceController.container.viewContext)
        let recipeIngredient2 = RecipeIngredient(context: persistenceController.container.viewContext)
        
        ingredient1.salt = 5
        ingredient2.salt = 7
        recipeIngredient1.ingredient = ingredient1
        recipeIngredient1.quantity = 2
        recipeIngredient2.ingredient = ingredient2
        recipeIngredient2.quantity = 2
        
        recipe.addToRecipeIngredients(recipeIngredient1)
        recipe.addToRecipeIngredients(recipeIngredient2)
        
        let result1 = recipe.salt
        let result2 = recipe.saltPerPerson
        
        XCTAssertEqual(Double(result1 / 4), result2)
    }
    
    func test_Recipe_WhenIngredientsAndServesIsSetTo4_SaturatesPerPersonShouldBeAQuarterOfSaturates() {
        let recipe = Recipe(context: persistenceController.container.viewContext)
        recipe.serves = 4
        
        let ingredient1 = Ingredient(context: persistenceController.container.viewContext)
        let ingredient2 = Ingredient(context: persistenceController.container.viewContext)
        let recipeIngredient1 = RecipeIngredient(context: persistenceController.container.viewContext)
        let recipeIngredient2 = RecipeIngredient(context: persistenceController.container.viewContext)
        
        ingredient1.saturates = 5
        ingredient2.saturates = 7
        recipeIngredient1.ingredient = ingredient1
        recipeIngredient1.quantity = 2
        recipeIngredient2.ingredient = ingredient2
        recipeIngredient2.quantity = 2
        
        recipe.addToRecipeIngredients(recipeIngredient1)
        recipe.addToRecipeIngredients(recipeIngredient2)
        
        let result1 = recipe.saturates
        let result2 = recipe.saturatesPerPerson
        
        XCTAssertEqual(Double(result1 / 4), result2)
    }
    
    func test_Recipe_WhenIngredientsAndServesIsSetTo4_SugarsPerPersonShouldBeAQuarterOfSugars() {
        let recipe = Recipe(context: persistenceController.container.viewContext)
        recipe.serves = 4
        
        let ingredient1 = Ingredient(context: persistenceController.container.viewContext)
        let ingredient2 = Ingredient(context: persistenceController.container.viewContext)
        let recipeIngredient1 = RecipeIngredient(context: persistenceController.container.viewContext)
        let recipeIngredient2 = RecipeIngredient(context: persistenceController.container.viewContext)
        
        ingredient1.sugars = 5
        ingredient2.sugars = 7
        recipeIngredient1.ingredient = ingredient1
        recipeIngredient1.quantity = 2
        recipeIngredient2.ingredient = ingredient2
        recipeIngredient2.quantity = 2
        
        recipe.addToRecipeIngredients(recipeIngredient1)
        recipe.addToRecipeIngredients(recipeIngredient2)
        
        let result1 = recipe.sugars
        let result2 = recipe.sugarsPerPerson
        
        XCTAssertEqual(Double(result1 / 4), result2)
    }
    
    func test_Recipe_WhenSettingWrappedName_NameShouldUpdate() {
        let recipe = Recipe(context: persistenceController.container.viewContext)
        let name = "test"
        
        recipe.wrappedName = name
        
        XCTAssertEqual(recipe.name, name)
    }
}
