//
//  RecipeTags.swift
//  MealPlanner
//
//  Created by Joshua Rogers on 30/03/2022.
//

import Foundation
import SwiftUI

enum RecipeTag: String, Equatable, CaseIterable {
    case breakfast = "Breakfast"
    case lunch = "Lunch"
    case dinner = "Dinner"
    case untagged = "Untagged"
    
    var localizedName: LocalizedStringKey {
        LocalizedStringKey(rawValue)
    }
}
