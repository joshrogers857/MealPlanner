//
//  Recipe.swift
//  MealPlanner
//
//  Created by Joshua Rogers on 08/03/2022.
//

import Foundation

struct Recipe: Identifiable, Equatable {
    var id: String {
        name.trimmingCharacters(in: .whitespacesAndNewlines).lowercased()
    }
    var name: String
    var preparationTime: TimeInterval
    var cookingTime: TimeInterval
    var serves: Int
    var ingredients: [String]
    var instructions: [String]
}
