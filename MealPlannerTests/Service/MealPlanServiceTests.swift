//
//  MealPlanServiceTests.swift
//  MealPlannerTests
//
//  Created by Joshua Rogers on 15/03/2022.
//

import XCTest
@testable import MealPlanner

class MealPlanServiceTests: XCTestCase {
    var persistenceController: PersistenceController!
    var mealPlanService: MealPlanService!
    
    override func setUpWithError() throws {
        persistenceController = PersistenceController(inMemory: true)
        mealPlanService = MealPlanService(moc: persistenceController.container.viewContext)
    }

    override func tearDownWithError() throws {
        persistenceController = nil
        mealPlanService = nil
    }
    
    func test_MealPlanService_FetchingAMealPlanForADateWithNoMealPlan_ResultShouldBeNil() {
        let result = mealPlanService.fetchMealPlan(date: Date.now)
        
        XCTAssertNil(result)
    }
    
    func test_MealPlanService_FetchingAMealPlanForADateWithAMealPlan_ResultShouldBeNotNil() {
        let mealPlan = MealPlan(context: persistenceController.container.viewContext)
        mealPlan.date = Date.now
        
        let result = mealPlanService.fetchMealPlan(date: Date.now)
        
        XCTAssertNotNil(result)
    }
    
    func test_MealPlanService_CreatingAMealPlanForADateWithNoMealPlan_ResultShouldBeNotNil() {
        let result = try? mealPlanService.createMealPlan(date: Date.now)
        
        XCTAssertNotNil(result)
        XCTAssertEqual(result?.stagesArray[0].wrappedName, "Stage1")
    }
    
    func test_MealPlanService_CreatingAMealPlanForADateWithAMealPlan_ErrorShouldBeThrown() {
        _ = try? mealPlanService.createMealPlan(date: Date.now)
        
        XCTAssertThrowsError(try mealPlanService.createMealPlan(date: Date.now))
    }
}
