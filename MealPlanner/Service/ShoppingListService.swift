//
//  ShoppingListService.swift
//  MealPlanner
//
//  Created by Joshua Rogers on 28/03/2022.
//

import Foundation
import SwiftUI

struct ShoppingListService {
    func totalIngredients(mealPlans: FetchedResults<MealPlan>) -> [String] {
        var totals = [(Double, Ingredient?)]()
        var scalePercentage: Double = 0.0
        
        for plan in mealPlans {
            for stage in plan.stagesArray {
                for recipe in stage.recipesArray {
                    for recipeIngredient in recipe.recipeIngredientsArray {
                        
                        scalePercentage = Double(stage.numberEating) / Double(recipe.serves)
                        
                        //If our array already contains the ingredient
                        if(totals.contains { $0.1 == recipeIngredient.ingredient }) {
                            let index = totals.firstIndex{ $0.1 == recipeIngredient.ingredient }
                            
                            if(index != nil) {
                                totals[index!].0 += (Double(recipeIngredient.quantity) * scalePercentage)
                            }
                        } else {
                            totals.append(((Double(recipeIngredient.quantity) * scalePercentage), recipeIngredient.ingredient))
                        }
                    }
                }
            }
        }
        
        var strings = [String]()
        
        for total in totals {
            if(total.1?.quantity ?? 0 > 1) {
                strings.append("\(round(total.0 * 100) / 100)x \(total.1?.quantity ?? 0)\(total.1?.wrappedUnit ?? "Unknown") \(total.1?.wrappedName ?? "Unknown")")
            } else {
                strings.append("\(round(total.0 * 100) / 100)\(total.1?.wrappedUnit ?? "Unknown") \(total.1?.wrappedName ?? "Unknown")")
            }
        }
        
        return strings
    }
}
