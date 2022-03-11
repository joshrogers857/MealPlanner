//
//  MealPlanStage.swift
//  MealPlanner
//
//  Created by Joshua Rogers on 10/03/2022.
//

import Foundation

struct MealPlanStage: Identifiable, Equatable {
    var id: String {
        name.trimmingCharacters(in: .whitespacesAndNewlines).lowercased()
    }
    var name: String
    var recipes: [Recipe]
    
    static func == (lhs: MealPlanStage, rhs: MealPlanStage) -> Bool {
        lhs.name == rhs.name && lhs.recipes == rhs.recipes
    }
}
