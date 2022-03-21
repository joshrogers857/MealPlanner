//
//  MealPlanServiceTests.swift
//  MealPlannerTests
//
//  Created by Joshua Rogers on 15/03/2022.
//

import XCTest
import CoreData
@testable import MealPlanner

class MealPlanServiceTests: XCTestCase {
    var mealPlanService = MealPlanService()
    var persistenceController: PersistenceController!
    var fetchRequest: NSFetchRequest<MealPlan>!
    
    override func setUpWithError() throws {
        persistenceController = PersistenceController(inMemory: true)
        fetchRequest = MealPlan.fetchRequest()
    }

    override func tearDownWithError() throws {
        persistenceController = nil
        fetchRequest = nil
    }
    
    func test_MealPlanService_CreatingAMealPlanForADateWithNoMealPlan_ResultShouldNotBeEmpty() {
        _ = try? mealPlanService.createMealPlan(date: Date.now, moc: persistenceController.container.viewContext)
        
        let result = try? persistenceController.container.viewContext.fetch(fetchRequest)
        
        XCTAssertFalse(result?.isEmpty ?? true)
    }
    
    func test_MealPlanService_CreatingAMealPlanForADateWithAMealPlan_ErrorShouldBeThrown() {
        let date = Date.now
        
        try? mealPlanService.createMealPlan(date: date, moc: persistenceController.container.viewContext)
        
        XCTAssertThrowsError(try mealPlanService.createMealPlan(date: date, moc: persistenceController.container.viewContext))
    }
}
