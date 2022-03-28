//
//  IngredientServiceTests.swift
//  MealPlannerTests
//
//  Created by Joshua Rogers on 28/03/2022.
//

import XCTest
@testable import MealPlanner

class IngredientServiceTests: XCTestCase {

    func test_IngredientService_CalculatingScaleWithNilPercentage_ShouldReturnFullQuantity() {
        let ingredientService = IngredientService()
        let quantity: Int16 = 80
        let percentage: Double? = nil
        
        let result = ingredientService.scaledRecipeIngredientQuantity(quantity: quantity, percentage: percentage)
        
        XCTAssertEqual(result, String(quantity))
    }

    func test_IngredientService_CalculatingScaleWithTwentyFivePercent_ShouldReturnTwentyFivePercentOfQuantity() {
        let ingredientService = IngredientService()
        let quantity: Int16 = 80
        let percentage: Double? = 0.25
        
        let result = ingredientService.scaledRecipeIngredientQuantity(quantity: quantity, percentage: percentage)
        
        XCTAssertEqual(result, String(Double(quantity) * percentage!))
    }
}
