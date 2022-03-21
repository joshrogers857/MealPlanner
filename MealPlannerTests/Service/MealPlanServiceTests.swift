//
//  MealPlanServiceTests.swift
//  MealPlannerTests
//
//  Created by Joshua Rogers on 15/03/2022.
//

import XCTest
import CoreData
@testable import MealPlanner

/* class MealPlanServiceTests: XCTestCase {
    var persistenceController: PersistenceController!
    
    override func setUpWithError() throws {
        persistenceController = PersistenceController(inMemory: true)
    }

    override func tearDownWithError() throws {
        persistenceController = nil
    }
    
    func test_MealPlanService_CreatingAMealPlanForADateWithNoMealPlan_ResultShouldBeNotNil() {
        _ = try? MealPlanService.createMealPlan(date: Date.now)
        
        let result = FetchRequest<MealPlan>(
            sortDescriptors: [],
            predicate: predicate
        )
        
        XCTAssertNotNil(result)
        XCTAssertEqual(result?.stagesArray[0].wrappedName, "Stage1")
    }
    
    func test_MealPlanService_CreatingAMealPlanForADateWithAMealPlan_ErrorShouldBeThrown() {
        _ = try? MealPlanService.createMealPlan(date: Date.now)
        
        XCTAssertThrowsError(try MealPlanService.createMealPlan(date: Date.now))
    }
}*/
