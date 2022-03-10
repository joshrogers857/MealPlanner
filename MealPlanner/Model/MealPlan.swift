//
//  MealPlan.swift
//  MealPlanner
//
//  Created by Joshua Rogers on 10/03/2022.
//

import Foundation

struct MealPlan: Identifiable {
    var id: String {
        let df = DateFormatter()
        return df.string(from: date)
    }
    var date: Date
    var stages: [MealPlanStage]
}
