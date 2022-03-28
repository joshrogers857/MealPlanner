//
//  IngredientService.swift
//  MealPlanner
//
//  Created by Joshua Rogers on 28/03/2022.
//

import Foundation

struct IngredientService {
    func scaledRecipeIngredientQuantity(quantity: Int16, percentage: Double?) -> String {
        if(percentage != nil) {
            return String(round(Double(quantity) * percentage! * 100) / 100.0)
        } else {
            return String(quantity)
        }
    }
}
