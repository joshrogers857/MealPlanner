//
//  RecipeTests.swift
//  MealPlannerTests
//
//  Created by Joshua Rogers on 08/03/2022.
//

import XCTest
@testable import MealPlanner

class RecipeTests: XCTestCase {

    func testRecipe_Should_Exist() throws {
        let _ = Recipe(
            name: "New Recipe",
            preparationTime: 300.0,
            cookingTime: 900.0,
            serves: 2,
            ingredients: [
                "ingredient1",
                "ingredient2",
                "ingredient 3"
            ],
            instructions: [
                "step1",
                "step2",
                "step3"
            ]
        )
    }
    
    func testRecipe_Should_Print_Description() throws {
        //.description is called by print(myInstance)
        
        let recipe = Recipe(
            name: "New Recipe",
            preparationTime: 300.0,
            cookingTime: 900.0,
            serves: 2,
            ingredients: [
                "ingredient1",
                "ingredient2",
                "ingredient 3"
            ],
            instructions: [
                "step1",
                "step2",
                "step3"
            ]
        )
        
        let desiredPrintDescription = """
            Recipe: New Recipe
                Prep. time: 300.0
                Cooking time: 900.0
                Serves: 2 people
                Ingredients:
                    ["ingredient1", "ingredient2", "ingredient 3"]
                Instructions:
                    ["step1", "step2", "step3"]
            """
        
        XCTAssert(recipe.description == desiredPrintDescription)
    }
}
