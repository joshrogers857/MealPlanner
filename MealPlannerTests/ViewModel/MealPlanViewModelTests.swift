//
//  MealPlanViewModelTests.swift
//  MealPlannerTests
//
//  Created by Joshua Rogers on 10/03/2022.
//

import XCTest
@testable import MealPlanner

class MealPlanViewModelTests: XCTestCase {
    
    override func setUpWithError() throws {
        MealPlans.plans.append(
            MealPlan(
                date: Date.now,
                stages: [
                    MealPlanStage(
                        name: "stage1",
                        recipes: [
                            Recipe(
                                name: "recipe1",
                                preparationTime: 0.0,
                                cookingTime: 0.0,
                                serves: 0,
                                ingredients: [],
                                instructions: [])
                        ])
                ])
        )
    }

    override func tearDownWithError() throws {
        MealPlans.plans = []
    }
    
    func test_MealPlanViewModel_IfNoPlanForDayExists_MealPlanShouldBeNil() {
        let vm = MealPlanViewModel(date: Date.now.addingTimeInterval(86400))
        
        let mealPlan = vm.mealPlan
        
        XCTAssertNil(mealPlan)
    }
    
    func test_MealPlanViewModel_IfPlanExists_MealPlanShouldNotBeNil() {
        let vm = MealPlanViewModel(date: Date.now)
        
        let mealPlan = vm.mealPlan
        
        XCTAssertNotNil(mealPlan)
    }
}
