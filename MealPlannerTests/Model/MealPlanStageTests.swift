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
}
