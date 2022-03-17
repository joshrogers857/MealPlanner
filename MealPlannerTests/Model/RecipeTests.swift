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
        
        XCTAssertTrue(recipe.ingredientsArray.isEmpty)
    }
    
    func test_Recipe_WhenCreated_InstructionsArrayShouldReturnEmptyArray() {
        let recipe = Recipe(context: persistenceController.container.viewContext)
        
        XCTAssertTrue(recipe.instructionsArray.isEmpty)
    }
    
    func test_Recipe_WhenCreated_MealPlanStagesArrayShouldReturnEmptyArray() {
        let recipe = Recipe(context: persistenceController.container.viewContext)
        
        XCTAssertTrue(recipe.mealPlanStagesArray.isEmpty)
    }
}
