//
//  MealPlanStage.swift
//  MealPlanner
//
//  Created by Joshua Rogers on 10/03/2022.
//

import Foundation

struct MealPlanStage: Identifiable {
    var id: String {
        name.trimmingCharacters(in: .whitespacesAndNewlines).lowercased()
    }
    var name: String
    var recipes: [Recipe]
}
