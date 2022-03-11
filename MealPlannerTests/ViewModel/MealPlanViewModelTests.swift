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
                date: Date.now.addingTimeInterval(86400), //Tomorrow
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
    
    //use that onattach thing to init the view model in the view
    
    func test_MealPlanViewModel_WhenCreated_MealPlanShouldBeNil() {
        let vm = MealPlanViewModel()
        
        let mealPlan = vm.mealPlan
        
        XCTAssertNil(mealPlan)
    }
    
    func test_MealPlanViewModel_WhenNoPlanForDateExists_MealPlanShouldBeNil() {
        let vm = MealPlanViewModel()
        
        vm.fetchMealPlan(date: Date.now)
        let mealPlan = vm.mealPlan
        
        XCTAssertNil(mealPlan)
    }
    
    func test_MealPlanViewModel_WhenPlanForDateExists_MealPlanShouldBeNotNil() {
        let vm = MealPlanViewModel()
        
        vm.fetchMealPlan(date: Date.now.addingTimeInterval(86400))
        let mealPlan = vm.mealPlan
        
        XCTAssertNotNil(mealPlan)
    }
    
    func test_MealPlanViewModel_CreatingANewMealPlanWhenOneDoesNotExistForDate_MealPlanShouldBeCreated() {
        let vm = MealPlanViewModel()
        
        let newMealPlan = MealPlan(
            date: Date.now,
            stages: [
                MealPlanStage(
                    name: "stage1",
                    recipes: []
                )
            ]
        )
        
        vm.fetchMealPlan(date: Date.now)
        let existingMealPlan = vm.mealPlan
        
        vm.createMealPlan(with: newMealPlan)
        
        let updatedMealPlan = vm.mealPlan
        
        XCTAssertNil(existingMealPlan)
        XCTAssertEqual(newMealPlan, updatedMealPlan)
    }
    
    func test_MealPlanViewModel_CreatingANewMealPlanWhenOneDoesExistForDate_MealPlanShouldBeOverwritten() {
        let vm = MealPlanViewModel()
        
        let newMealPlan = MealPlan(
            date: Date.now.addingTimeInterval(86400),
            stages: [
                MealPlanStage(
                    name: "stage1",
                    recipes: []
                )
            ]
        )
        
        vm.fetchMealPlan(date: Date.now.addingTimeInterval(86400))
        let existingMealPlan = vm.mealPlan
        
        vm.createMealPlan(with: newMealPlan)
        
        let updatedMealPlan = vm.mealPlan
        
        XCTAssertNotNil(existingMealPlan)
        XCTAssertNotEqual(existingMealPlan, updatedMealPlan)
        XCTAssertEqual(newMealPlan, updatedMealPlan)
    }
    
    func test_MealPlanViewModel_CreatingANewMealPlanWhenOneDoesNotExistForDate_MealPlanShouldBeAddedToModel() {
        let vm = MealPlanViewModel()
        
        let newMealPlan = MealPlan(
            date: Date.now,
            stages: [
                MealPlanStage(
                    name: "stage1",
                    recipes: []
                )
            ]
        )
        
        vm.createMealPlan(with: newMealPlan)
        
        XCTAssertTrue(MealPlans.plans.contains(newMealPlan))
    }
    
    func test_MealPlanViewModel_CreatingANewMealPlanWhenOneDoesExistForDate_MealPlanShouldOverwriteModel() {
        let vm = MealPlanViewModel()
        
        let newMealPlan = MealPlan(
            date: Date.now.addingTimeInterval(86400),
            stages: [
                MealPlanStage(
                    name: "stage1",
                    recipes: []
                )
            ]
        )
        
        vm.createMealPlan(with: newMealPlan)
        
        let mealPlan = vm.mealPlan
        
        XCTAssertTrue(MealPlans.plans.count == 1)
        XCTAssertEqual(newMealPlan, mealPlan)
    }
}
