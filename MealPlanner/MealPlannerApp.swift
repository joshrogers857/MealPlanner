//
//  MealPlannerApp.swift
//  MealPlanner
//
//  Created by Joshua Rogers on 22/02/2022.
//

import SwiftUI

@main
struct MealPlannerApp: App {
    var body: some Scene {
        WindowGroup {
            MealPlan().environmentObject(RecipeListViewModel())
        }
    }
}
