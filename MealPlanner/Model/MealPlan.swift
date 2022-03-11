//
//  MealPlan.swift
//  MealPlanner
//
//  Created by Joshua Rogers on 10/03/2022.
//

import Foundation

struct MealPlan: Identifiable, Equatable {
    var id: String {
        let df = DateFormatter()
        return df.string(from: date)
    }
    var date: Date
    var stages: [MealPlanStage]
    
    static func == (lhs: MealPlan, rhs: MealPlan) -> Bool {
        lhs.date == rhs.date && lhs.stages == rhs.stages
    }
}
