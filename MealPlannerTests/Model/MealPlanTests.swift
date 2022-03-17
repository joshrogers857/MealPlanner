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
}
